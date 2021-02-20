####
#  "all-in-one" update script
#
#  use:
#    $ ruby -I ./lib -I ../kittyverse/lib script/update.rb


require 'kittypedia'


page = GenesPage.new
page.save( "./o/GENES.md" )


page = TraitsPage.new
page.save( "./o/TRAITS.md" )


page = TimelineFanciesPage.new
File.open( "./o/TIMELINE-FANCIES.md", 'w:utf-8' ) do |f|
  f.write page.build
end

page = TimelinePurrstigesPage.new
File.open( "./o/TIMELINE-PURRSTIGES.md", 'w:utf-8' ) do |f|
  f.write page.build
end

page = TimelineTraitsPage.new
File.open( "./o/TIMELINE-TRAITS.md", "w:utf-8" ) do |f|
  f.write page.build
end



puts "Done."
