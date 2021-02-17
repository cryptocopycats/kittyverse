# encoding: utf-8

####
# use:
#  $ ruby -I ./lib script/fetch.rb



require 'kittyverse'


def save( name, data )
  path = "./dl/#{name}.json"
  dirs = File.dirname( path )
  FileUtils.mkdir_p( dirs ) unless Dir.exist?( dirs)

  File.open( path, 'w:utf-8' ) do |f|
    f.write JSON.pretty_generate( data )
  end
end



Kitties.debug=true


c = Kitties::V0::Client.new
data = c.get_cattributes    ## same as get( '/cattributes' )
save( "v0/cattributes", data )

data = c.get_kitty( 1 )     ## same as get( '/kitties/1' )
save( "v0/kitty-1", data )


## note: requires CryptoKitties API Token; set in ENV via KITTIES_TOKEN
c = Kitties::V1::Client.new
data = c.get_cattributes  ## same as get( '/cattributes' )
save( "v1/cattributes", data )

data = c.get_kitty( 1 )   ## same as get( '/kitties/1' )
save( "v1/kitty-1", data )

data = c.get_colors_body  ## same as get( '/colors/body' )
save( "v1/colors-body", data )
data = c.get_colors_eyes  ## same as get( '/colors/eyes' )
save( "v1/colors-eyes", data )
data = c.get_colors_secondary  ## same as get( '/colors/secondary' )
save( "v1/colors-secondary", data )
data = c.get_colors_tertiary  ## same as get( '/colors/tertiary' )
save( "v1/colors-tertiary", data )


data = c.get( '/cattributes/eyes/12' )
save( "v1/cattributes-eyes-12", data )

data = c.get( '/kitties?gen=3-4' )   ## todo: check pass query parameters in its own arguments - why? why not?
save( "v1/kitties-gen_3-4", data)
