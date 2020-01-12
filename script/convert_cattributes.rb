# encoding: utf-8

###
# see https://api.cryptokitties.co/cattributes

require 'json'
require 'pp'

txt = File.read( './dl/cattributes-2020-01-12.json' )

data = JSON.parse( txt )
## pp data

data = data.reverse  ## note: list most rare first / most popular last


recs = []
data.each do |row|
  rec = []

  rec << row['total']
  rec << row['description']
  rec << row['type']

  recs << rec
end

pp recs


csv = ""

csv << ("%-6s, %-15s, %-14s" % ['Total', 'Description', 'Type'])
csv << "\n"
recs.each_with_index do |rec,i|
  csv << ("%6s, %-15s, %-14s" % rec)
  csv << "\n"
  ## break if i > 5
end


File.open( "./datasets/cattributes.csv", "w:utf-8" ) do |f|
  f.write csv
end
