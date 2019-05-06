# encoding: utf-8

####
# use:
#  $ ruby -I ./lib script/cattributes.rb

require 'csvreader'
require 'kittyverse'



recs = CsvHash.read( "./datasets/cattributes.csv" )
pp recs


## group by type

types = {}

recs.each do |h|
  tt = TraitType.find_by( key: h['Type'] )    ## note: map to "interal" trait type key
  key = tt.key   ## use to_sym - why? why not?
  rec = types[ key ] ||= [0,[]]

  rec[ 0 ] += h['Total'].to_i   ## up totals
  rec[ 1 ] << [h['Description'],h['Total'].to_i]


  ## double check traits if present / known / defined
  trait = Trait.find_by( name: h['Description'] )
  if trait
    if trait.type.name != tt.name  ### use trait.type == trait_type !!!
      puts "mismatched trait - expected >#{trait.type}< got:"
      pp h
      exit 1
    end
  else
   ## note: skip prestige for know
    next  if h['Type'] == 'prestige'
    next  if h['Description'] == 'totesbasic'

    puts "unknown / undefined trait:"
    pp h
    exit 1
  end
end


pp types



buf = ""
buf += <<TXT
# Cattributes Rarity / Popularity Statistics

(Source: [`api.cryptokitties.co/cattributes` (JSON)](https://api.cryptokitties.co/cattributes), [(CSV)](datasets/cattributes.csv))


TXT







Traits.each do |tt|
  next if [:secret].include?( tt.key )    ## skip secret traits for now

  rec = types[ tt.key ]
  pp tt.key
  pp rec
  total = rec[0]
  items = rec[1]

  buf << "## #{tt.name} (Genes #{tt.genes})\n\n"

  buf << "_#{total} Cats with #{items.size} Cattributes_\n\n"

  buf << "| #|Total (%)|Cattribute|\n"
  buf << "|-:|--------:|----------|\n"


  items.each_with_index do |item,i|

    name  = item[0]
    count = item[1]

    rank  = "#{i+1}/#{items.size}"

    percent = Float(100*count)/Float(total)

    buf << "| #{rank} | #{count} (#{('%2.2f' % percent)}) | "
    buf << "[**#{name}**](#{kitties_search_url(name)}) |"
    ## todo: add mewtation level and code/kai etc.

    buf << "\n"
  end

  buf << "\n\n"
end

puts buf

File.open( "./CATTRIBUTES.md", "w:utf-8" ) do |f|
  f.write buf
end
