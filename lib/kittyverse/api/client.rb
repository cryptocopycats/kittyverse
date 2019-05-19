# encoding: utf-8

module Kitties

  class Error < StandardError
  end

  ####
  # todo/check:
  #  rename to HttpRequestError or similar??
  #  use "common" error class - why? why not?
  class HttpError < Error
    attr_reader :code, :message

    def initialize( code, message )
      @code, @message = code, message
    end

    def to_s
      "HTTP request failed (NOK) => #{@code} #{@message}"
    end
  end


  class Response    ## track last response
    attr_accessor :code,    :message,
                  :headers, :body

    def initialize( code, message, headers, body )
      @code, @message, @headers, @body = code, message, headers, body
    end

    ## ratelimit convenience helpers (for headers)
    ##  note: all values of headers are arrays e.g.:
    ##         {"x-ratelimit-limit"=>["20"],
    ##          "x-ratelimit-remaining"=>["19"],
    ##          "x-ratelimit-reset"=>["1558206970"],
    ##          "content-length"=>["776"], ... }

    def ratelimit_limit
      limit = @headers['x-ratelimit-limit']
      limit ? limit[0].to_i : nil
    end

    def ratelimit_remaining
      remaining = @headers['x-ratelimit-remaining']
      remaining ? remaining[0].to_i : nil
    end

    def ratelimit_reset?
      ## x-ratelimit-reset => 1558079593   ## - assume it's unix epoch time
      reset = @headers['x-ratelimit-reset']
      reset ? (reset[0].to_i < Time.now.to_i) : true  ## always assume true (unlimited requests)
    end

    def ratelimit_reset
      ## x-ratelimit-reset => 1558079593   ## - assume it's unix epoch time
      reset = @headers['x-ratelimit-reset']
      reset ? Time.at(reset[0].to_i) : nil
    end
  end  ## class Response (used for tracking last(_response))



class Client

##
## todo: add (optional) close with @http.close - why? why not?

def initialize( base_uri:, token: nil )
  uri = URI.parse( base_uri )
  @http = Net::HTTP.new( uri.host, uri.port )
  if uri.instance_of? URI::HTTPS
    @http.use_ssl = true
    @http.verify_mode = OpenSSL::SSL::VERIFY_NONE
  end

  @base_request_uri  = uri.request_uri    ## e.g. save /v1 etc.
  ## puts "base_request_uri: >#{@base_request_uri}<"

  @request_headers = if token
                      { "x-api-token" => token  }
                     else
                      {}
                     end
end # method initialize

def get( service, **params )

  ## add url-encoded query string from params hash e.g. ?limit=100&type=sale
  unless params.empty?
    query = URI.encode_www_form( params )
    service += "?#{query}"
  end

  puts "GET #{service}"

  request_uri = if @base_request_uri == "/"
                    service
                else
                   "#{@base_request_uri}#{service}"  ## e.g. add /v1 etc.
                end

  pp @request_headers

  req = Net::HTTP::Get.new( request_uri, @request_headers )

  res = @http.request(req)

  headers = res.to_hash   ## get all response headers

  if Kitties.debug?
    # Iterate all response headers.
    # res.each_header do |key, value|
    #  p "#{key} => #{value}"
    # end
    pp headers
    # => "content-type => application/json; charset=utf-8"
    # => "x-ratelimit-limit => 20"
    # => "x-ratelimit-remaining => 19"
    # => "x-ratelimit-reset => 1558079593"
    # ...
  end

  body = res.read_body
  ## pp body

  ## track last response
  Kitties.last_response = Response.new( res.code,
                                        res.message,
                                        headers,
                                        body )

  if res.code != '200'
    raise HttpError.new( res.code, res.message )
  end


  json = JSON.parse( body )  ## use just body (any difference?) -  why? why not?
  ## pp json
  json
end  # method get

end  ## class Client


end # module Kitties
