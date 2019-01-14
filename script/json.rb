# encoding: utf-8

####
# use:
#  $ ruby -I ./lib script/json.rb


require 'kittyverse'


File.open( 'build/traits.json', 'w:utf-8' ) do |f|
  f.write JSON.pretty_generate( TRAITS )
end

# File.open( 'build/traits_timeline.json', 'w:utf-8' ) do |f|
#  f.write JSON.pretty_generate( TRAITS_TIMELINE )
# end

File.open( 'build/fancies.json', 'w:utf-8' ) do |f|
  f.write JSON.pretty_generate( FANCIES )
end
