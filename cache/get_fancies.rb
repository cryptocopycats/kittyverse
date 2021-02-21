####
# use:
#  $ ruby -I ../kittyverse-api/lib -I ../kittyverse/lib get_fancies.rb

require_relative 'helper'


EXCLUSIVES.each do |_,rec|
  puts "#{rec[:name]}:"
  exclusive = rec[:exclusive]
  ids = exclusive[:ids]
  pp ids

  ids.each do |id|
    save_kitty( id )
  end
end




puts "bye"