####
# use:
#  $ ruby -I ./lib script/fetch_v0.rb



require 'kittyverse/api'



def save( name, data )
  File.open( "./dl/#{name}.json", 'w:utf-8' ) do |f|
    f.write JSON.pretty_generate( data )
  end
end


Kitties.debug=true


c = Kitties::V0::Client.new

today = Date.today.strftime( '%Y-%m-%d')   ## e.g. 2019-05-19


data = c.get_cattributes    ## same as get( '/cattributes' )
save( "v0/cattributes-#{today}", data )

pp Kitties.last_response
pp Kitties.last_response.headers
pp Kitties.last_response.ratelimit_reset


data = c.get_kitty( 1 )     ## same as get( '/kitties/1' )
save( "v0/kitty-1-#{today}", data )
data = c.get_kitten( 2 )

pp Kitties.last_response.headers
pp Kitties.last_response.ratelimit_reset
pp Time.now
pp Kitties.last_response.ratelimit_limit
pp Kitties.last_response.ratelimit_remaining
pp Kitties.last_response.ratelimit_reset?

pp c.get_auctions( limit: 2 )

pp c.get_kitties( limit: 2 )

pp c.get_kitties( owner_wallet_address: '0xc5e38233cc0d7cff9340e6139367aba498ec9b18',
                  limit: 2 )

pp c.get_network_status
pp c.get_user( '0xc5e38233cc0d7cff9340e6139367aba498ec9b18' )
