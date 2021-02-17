module Kitties
module V0
class Client < ::Kitties::Client
  def initialize
    super( base_uri: "https://api.cryptokitties.co" )
  end

  def get_cattributes()  get('/cattributes'); end
  def get_kitty( id )    get("/kitties/#{id}"); end   ## use get_kitty_by_id - why? why not?
  alias_method :get_kitten, :get_kitty

  def get_kitties( **params )  get( '/kitties', **params ); end
  def get_auctions( **params ) get( '/auctions', **params ); end
  def get_user( addr )  get( "/user/#{addr}" ); end

  def get_network_status() get( '/network-status' ); end

end # class Client
end # module V0
end # module Kitties

