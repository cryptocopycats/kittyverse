require "pp"
require "uri"
require "net/http"
require "net/https"
require "json"



def fetch( src )

  uri = URI.parse( src )

  http = Net::HTTP.new( uri.host, uri.port )
  headers = {
    "x-api-token" => "xxxx"
  }
  request = Net::HTTP::Get.new( uri.request_uri, headers )

  if uri.instance_of? URI::HTTPS
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
  end

  response = http.request( request )

  puts response.code
  body = response.read_body
  pp body

  body
end


## txt = fetch( "https://public.api.cryptokitties.co/v1/colors/body" )
## txt = fetch( "https://public.api.cryptokitties.co/v1/colors/eyes" )
## txt = fetch( "https://public.api.cryptokitties.co/v1/colors/secondary" )
## txt = fetch( "https://public.api.cryptokitties.co/v1/colors/tertiary" )
txt = fetch( "https://public.api.cryptokitties.co/v1/cattributes" )

json = JSON.parse( txt )

name = "cattributes"

File.open( "./#{name}.raw.json", 'w:utf-8' ) do |f|
  f.write txt
end

File.open( "./#{name}.json", 'w:utf-8' ) do |f|
  f.write JSON.pretty_generate( json )
end

puts "Done."
