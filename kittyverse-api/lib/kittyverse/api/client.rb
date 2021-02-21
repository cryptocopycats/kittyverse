
############
# add some webclient response / headers extensions
#   move something upstream to webclient - why? why not?

class Webclient
  class Response
    class Headers
       def []( key )
         headers[ key ]
       end
       def headers
         @headers ||= begin
                       headers = {}
                       each { |key,value| headers[key]=value }   ## get all response headers
                      end
         @headers
       end
    end # class Headers


    ## ratelimit convenience helpers (for headers)
    ##  note: all values of headers are arrays e.g.:
    ##         {"x-ratelimit-limit"=>["20"],
    ##          "x-ratelimit-remaining"=>["19"],
    ##          "x-ratelimit-reset"=>["1558206970"],
    ##          "content-length"=>["776"], ... }

    def ratelimit_limit
      limit = headers['x-ratelimit-limit']
      limit ? limit[0].to_i : nil
    end

    def ratelimit_remaining
      remaining = headers['x-ratelimit-remaining']
      remaining ? remaining[0].to_i : nil
    end

    def ratelimit_reset?
      ## x-ratelimit-reset => 1558079593   ## - assume it's unix epoch time
      reset = headers['x-ratelimit-reset']
      reset ? (reset[0].to_i < Time.now.to_i) : true  ## always assume true (unlimited requests)
    end

    def ratelimit_reset
      ## x-ratelimit-reset => 1558079593   ## - assume it's unix epoch time
      reset = @headers['x-ratelimit-reset']
      reset ? Time.at(reset[0].to_i) : nil
    end
  end # class Response
end # class Webclient



###############
# main
module Kitties
class Client

##
## todo: add (optional) close with @http.close - why? why not?

def initialize( base_uri:, token: nil )
  @base_uri = base_uri
  @token    = token
end # method initialize


def get( service, **params )


  ## add url-encoded query string from params hash e.g. ?limit=100&type=sale
  unless params.empty?
    query = URI.encode_www_form( params )
    service += "?#{query}"
  end

  puts "GET #{service}"

  request_uri = "#{@base_uri}#{service}"

  request_headers = if @token
                      { "x-api-token" => token  }
                    else
                      {}
                    end

  res = Webget.call( request_uri, headers: request_headers )




  if Kitties.debug?
    # dump all response headers
    puts "headers:"
    res.headers.each do |key, value|
      puts "  #{key} : >#{value}<"
    end
    # => "content-type => application/json; charset=utf-8"
    # => "x-ratelimit-limit => 20"
    # => "x-ratelimit-remaining => 19"
    # => "x-ratelimit-reset => 1558079593"
    # ...
  end

  ## track last response
  Kitties.last_response = res


  if res.status.nok?
    puts "!! ERROR: HTTP #{res.status.code} #{res.status.message}:"
    pp res
    exit 1
  end


  res.json
end  # method get

end  ## class Client
end # module Kitties
