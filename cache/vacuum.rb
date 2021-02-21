####
# use:
#  $ ruby -I ../kittyverse-api/lib -I ../kittyverse/lib vacuum.rb

require_relative 'helper'


def vacuum
  ## out_dir = "./dl"
  out_dir = "../../cache.kitties.json"

  datafiles = Dir.glob( "#{out_dir}/**/*.json" )
  puts "   #{datafiles.size} datafile(s)"

  datafiles.each_with_index do |datafile,i|
     print "[#{i+1}]"
     text = File.open( datafile, 'r:utf-8') { |f| f.read }
     data = JSON.parse( text )
     data = convert_kitty( data )

     File.open( datafile, 'w:utf-8') do |f|
       f.write JSON.pretty_generate( data )
     end
  end
end



vacuum()

puts "bye"