####
# use:
#  $ ruby -I ./lib -I ../kittyverse/lib script/json.rb


require 'kittyverse'

BUILD_DIR = './build'
# BUILD_DIR = '../kittyverse.json'


File.open( "#{BUILD_DIR}/traits.json", 'w:utf-8' ) do |f|
  f.write JSON.pretty_generate( TRAITS )
end

# File.open( 'build/traits_timeline.json', 'w:utf-8' ) do |f|
#  f.write JSON.pretty_generate( TRAITS_TIMELINE )
# end


## note: split off (in new hash) fancies, exclusive & special edition fancies
#    - fancies.json (old all - now only "normal" with recipes trait breeding formula)
#        -> RECIPES
#    - exclusives.json
#        -> EXCLUSIVES
#    - special-editions.json
#        -> SPECIAL_EDITIONS

File.open( "#{BUILD_DIR}/fancies.json", 'w:utf-8' ) do |f|
  f.write JSON.pretty_generate( FANCIES )
end

File.open( "#{BUILD_DIR}/exclusives.json", 'w:utf-8' ) do |f|
  f.write JSON.pretty_generate( EXCLUSIVES )
end

File.open( "#{BUILD_DIR}/special-editions.json", 'w:utf-8' ) do |f|
  f.write JSON.pretty_generate( SPECIAL_EDITIONS )
end



File.open( "#{BUILD_DIR}/purrstiges.json", 'w:utf-8' ) do |f|
  f.write JSON.pretty_generate( PURRSTIGES )
end

puts "bye"