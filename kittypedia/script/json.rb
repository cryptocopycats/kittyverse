# encoding: utf-8

####
# use:
#  $ ruby -I ./lib script/json.rb


require 'kittyverse'

BUILD_DIR = './build'
# BUILD_DIR = '../kittyverse.json'


File.open( "#{BUILD_DIR}/traits.json", 'w:utf-8' ) do |f|
  f.write JSON.pretty_generate( TRAITS )
end

# File.open( 'build/traits_timeline.json', 'w:utf-8' ) do |f|
#  f.write JSON.pretty_generate( TRAITS_TIMELINE )
# end

File.open( "#{BUILD_DIR}/fancies.json", 'w:utf-8' ) do |f|
  f.write JSON.pretty_generate( FANCIES )
end

File.open( "#{BUILD_DIR}/purrstiges.json", 'w:utf-8' ) do |f|
  f.write JSON.pretty_generate( PURRSTIGES )
end
