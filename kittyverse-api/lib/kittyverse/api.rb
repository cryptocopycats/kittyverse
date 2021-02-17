## std libs
require 'pp'
require 'date'
require 'time'
require 'json'
require 'uri'
require 'net/http'
require 'net/https'
require 'fileutils'


## our own code
require 'kittyverse/api/version'    # note: let version always go first
require 'kittyverse/api/client'
require 'kittyverse/api/service_v0'
require 'kittyverse/api/service_v1'




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


  ## track last response
  def self.last_response()       @last_response; end
  def self.last_response=(value) @last_response = value; end


## CLIENT_V0 = V0::Client.new
## CLIENT_V1 = V1::Client.new
##
## def self.v0()  CLIENT_V0; end
## def self.v1()  CLIENT_V1; end
end  # module Kitties



# say hello
puts KittyverseClient.banner
