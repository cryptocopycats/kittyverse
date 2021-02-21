####
# use:
#  $ ruby -I ../kittyverse-api/lib get_kitties.rb

require 'kittyverse/api'



Kitties.debug=true


c = Kitties::V0::Client.new


data = c.get_kitty( 1 )     ## same as get( '/kitties/1' )

pp Kitties.last_response
pp Kitties.last_response.headers
pp Kitties.last_response.ratelimit_reset


data = c.get_kitten( 2 )


pp Kitties.last_response.headers
pp Kitties.last_response.ratelimit_reset
pp Time.now
pp Kitties.last_response.ratelimit_limit
pp Kitties.last_response.ratelimit_remaining
pp Kitties.last_response.ratelimit_reset?

