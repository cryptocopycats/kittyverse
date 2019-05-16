# encoding: utf-8

####
# use:
#  $ ruby -I ./lib script/colors.rb

require 'kittyverse'

## pp COLORS

class Color
  attr_reader :hex, :r, :g, :b
  def initialize( hex )
    @r = hex[1,2].to_i(16)
    @g = hex[3,2].to_i(16)
    @b = hex[5,2].to_i(16)
  end

  def hex
    "##{'%02x' % @r}#{'%02x' % @g}#{'%02x' % @b}"
  end
end  ## class Color



buf = ""
buf += <<HTML
<table cellpadding='8'>
  <tr>
    <th>Name</th>
    <th>Hex</th>
    <th>Red / Green / Blue</th>
  </tr>
HTML


COLORS.each do |name,hex|
  pp "#{name} => #{hex}"
  c = Color.new( hex )

  ## double check hex color code parsing (for r/g/b - red,green,blue)
  if hex != c.hex
    puts "color hex mismatch #{hex} <=> #{c.hex}"
    exit 1
  end

  buf += <<HTML
  <tr style='height: 32px; color: #fff; text-shadow: 1px 1px 2px #000; background-color: #{c.hex}'>
    <td>#{name}</td>
    <td>#{hex}</td>
    <td>#{'%3d%% %3d%% %3d%%' % [c.r*100/255,c.g*100/255,c.b*100/255]}</td>
  </tr>
HTML

end

buf << "</table>\n\n"

## puts buf

File.open( "./COLORS.html", 'w:utf-8' ) do |f|
  f.write buf
end

puts "Done."
