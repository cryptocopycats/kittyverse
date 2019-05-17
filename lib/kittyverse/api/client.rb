# encoding: utf-8

module Kitties


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

  @token = token
end # method initialize

def get( service )
  puts "GET #{service}"

  request_uri = if @base_request_uri == "/"
                    service
                else
                   "#{@base_request_uri}#{service}"  ## e.g. add /v1 etc.
                end

  headers = if @token
             { "x-api-token" => @token }
            else
             {}
            end

  req = Net::HTTP::Get.new( request_uri, headers )

  res = @http.request(req)

   ## todo/fix: add check for res.code == "200"
   ##   throw exception of fail


  if Kitties.debug?
    # Iterate all response headers.
    res.each_header do |key, value|
      p "#{key} => #{value}"
    end
    # => "content-type => application/json; charset=utf-8"
    # => "x-ratelimit-limit => 20"
    # => "x-ratelimit-remaining => 19"
    # => "x-ratelimit-reset => 1558079593"
    # ...
  end

  body = res.read_body
  ## pp body

  json = JSON.parse( body )  ## use just body (any difference?) -  why? why not?
  ## pp json
  json
end  # methdo get

end  ## class Client


end # module Kitties
