# encoding: utf-8

module Kitties

class Configuration
   attr_accessor :token
   attr_accessor :debug

   def initialize
     # try default setup via ENV variables
     @token    = ENV[ 'KITTIES_TOKEN' ]
     @debug    = false
   end
end

## lets you use
##   Kitties.configure do |config|
##      config.token    = 'secret'
##   end
def self.configuration
  @configuration ||= Configuration.new
end

def self.configure
  yield( configuration )
end

### debug convenience helpers
def self.debug?()       configuration.debug; end
def self.debug=(value)  configuration.debug = value; end




module V0
class Client < ::Kitties::Client
  def initialize
    super( base_uri: "https://api.cryptokitties.co" )
  end

  def get_cattributes()  get('/cattributes'); end
  def get_kitty( id )    get("/kitties/#{id}"); end   ## use get_kitty_by_id - why? why not?
end # class Client
end # module V0




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
  def get_colors_body()      get('/colors/body'); end
  def get_colors_eyes()      get('/colors/eyes'); end
  def get_colors_secondary() get('/colors/secondary'); end
  def get_colors_tertiary()  get('/colors/tertiary'); end

end # class Client
end  # module V1


CLIENT_V0 = V0::Client.new
CLIENT_V1 = V1::Client.new

def self.v0()  CLIENT_V0; end
def self.v1()  CLIENT_V1; end

end # module Kitties
