# encoding: utf-8

module Kitties


class Client

def initialize( base_uri: "https://api.cryptokitties.co", token: nil )
  uri = URI.parse( base_uri )
  @http = Net::HTTP.new(uri.host, uri.port)
  if uri.instance_of? URI::HTTPS
    @http.use_ssl = true
    @http.verify_mode = OpenSSL::SSL::VERIFY_NONE
  end

  @token = token
end # method initialize

def get( request_uri )
  puts "GET #{request_uri}"

  if @token
  else
  end

  req = Net::HTTP::Get.new( request_uri )

  res = @http.request(req)

  # Get specific header
  # response["content-type"]
  # => "text/html; charset=UTF-8"

  if Kitties.debug?
    # Iterate all response headers.
    res.each_header do |key, value|
      p "#{key} => #{value}"
    end
    # => "location => http://www.google.com/"
    # => "content-type => text/html; charset=UTF-8"
    # ...
  end

  json = JSON.parse( res.body )  ## use read_body -  why? why not?
  ## pp json
  json
end  # methdo get

end  ## class Client


end # module Kitties
