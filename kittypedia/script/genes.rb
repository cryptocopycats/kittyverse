# encoding: utf-8

####
# use:
#  $ ruby -I ./lib script/genes.rb


require 'kittyverse'


page = GenesPage.new
page.save( "./GENES.md" )
