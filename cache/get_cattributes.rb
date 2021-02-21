####
# use:
#  $ ruby -I ../kittyverse-api/lib get_cattributes.rb



require 'kittyverse/api'



Kitties.debug=true


c = Kitties::V0::Client.new

data = c.get_cattributes    ## same as get( '/cattributes' )

pp Kitties.last_response
pp Kitties.last_response.headers
pp Kitties.last_response.ratelimit_reset
