# encoding: utf-8

####
# use:
#  $ ruby -I ./lib script/gene_reader.rb



require 'kittyverse'


# 512955438081049600613224346938352058409509756310147795204209859701881294  # kitty 1001

genome = Genome.new( 512955438081049600613224346938352058409509756310147795204209859701881294 )

File.open( "./KITTY-1001.md", 'w:utf-8' ) do |f|
  f.write "# Kitty #1001\n\n"
  f.write genome.build_tables
end



def print_genes( genes )
  genome = Genome.new( genes )
  genome.each_with_index do |slice,i|
     offset = i*4
     puts "#{slice.type.name} (#{slice.type.code}) - Genes #{slice.type.genes}:"
     puts "#{'%2d' % (0+offset)} | #{slice.d.name || '∅'} (#{slice.d.code})"
     puts "#{'%2d' % (1+offset)} | #{slice.r1.name || '∅'} (#{slice.r1.code})"
     puts "#{'%2d' % (2+offset)} | #{slice.r2.name || '∅'} (#{slice.r2.code})"
     puts "#{'%2d' % (3+offset)} | #{slice.r3.name || '∅'} (#{slice.r3.code})"
     puts
  end
end


print_genes( 512955438081049600613224346938352058409509756310147795204209859701881294 )

puts "Done"
