module Kitties
module V1
###
##  see https://docs.api.cryptokitties.co

class Client < ::Kitties::Client
  def initialize
    super( base_uri: "https://public.api.cryptokitties.co/v1",
           token:    Kitties.configuration.token )
  end

  def get_cattributes()      get('/cattributes'); end
  def get_kitty( id )        get("/kitties/#{id}"); end  ## use get_kitty_by_id - why? why not?
  alias_method :get_kitten, :get_kitty

  def get_colors_body()      get('/colors/body'); end
  def get_colors_eyes()      get('/colors/eyes'); end
  def get_colors_secondary() get('/colors/secondary'); end
  def get_colors_tertiary()  get('/colors/tertiary'); end

end # class Client
end  # module V1
end  # module Kitties



