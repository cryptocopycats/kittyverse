# encoding: utf-8

####
# use:
#  $ ruby -I ./lib script/fancies_debug.rb



require 'kittyverse'


buf = ""
buf += <<TXT

# Updates - Fancy / Exclusive / Special Edition Cats - Timeline


TXT

def build_fancy( fancy )
  line = ""

  line << "- "
  if fancy.special_edition?
    line << "Special Edition "
  elsif fancy.exclusive?
    line << "Exclusive "
  else
  end

  name = ""
  name << fancy.name
  name << " (#{fancy.name_cn})"  if fancy.name_cn   # add chinese name if present

  line << "[**#{name}**]"
  line << "(#{kitties_fancy_search_url( fancy )})"


  line << " ("
  line << "#{fancy.count ? fancy.count : '?'}"
  line << "/"
  line << "#{fancy.limit ? fancy.limit : '?'}"

  if fancy.ids
    id_links = fancy.ids.map { |id| "[##{id}](#{kitties_kitty_url(id)})" }
    line << " - #{id_links.join(', ')}"
  end
  line << ")"

  line << " -- #{fancy.desc}"    if fancy.desc

  line
end



buf << "## Breedable\n\n"

Fancy.breedable.each do |fancy|
  buf << build_fancy( fancy )
  buf << "\n"
end

buf << "\n\n"
buf << "## All\n\n"

Fancy.each do |fancy|
  buf << build_fancy( fancy )
  buf << "\n"
end


puts buf


File.open( "./sandbox/FANCIES.md", 'w:utf-8' ) do |f|
  f.write buf
end

puts "Done."
