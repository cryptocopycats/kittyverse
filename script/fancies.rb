# encoding: utf-8

####
# use:
#  $ ruby -I ./lib script/fancies.rb



require 'kittyverse'

require_relative 'fancies2'


pp FANCIES


buf = ""
buf += <<TXT
# Updates - Fancy / Exclusive / Special Edition Cats - Timeline

see <https://updates.cryptokitties.co>


TXT



def build_fancy( fancy )
  name = ""
  name << fancy.name
  name << " (#{fancy.name_cn})"   if fancy.name_cn   # add chinese name if present

  line = "[**#{name}**]"
  ## line << "(#{kitties_fancy_search_url( key, h )})"

  ## todo/fix: limit/count !!!!
  if fancy.limit.nil?
    ## just display/use count
    line << " (#{fancy.count ? fancy.count : '?'})"
  else
    ## display/use count AND limit
    line << " (#{fancy.limit ? fancy.limit : '?'}"    # add limit if present/known
    ## line << "+#{h[:overflow]}"    if h[:overflow]
    line << ")"
  end

  line
end



def build_fancies( fancies )
  buf = ""
  fancies.each do |fancy|
    buf << build_fancy( fancy )
    buf << "\n"
  end
  buf
end


buf << "## Special Edition Cats (#{Fancy.special_editions.size})"
buf << "\n\n"
buf << build_fancies( Fancy.special_editions )
buf << "\n\n\n"

buf << "## Exclusive Cats (#{Fancy.exclusives.size})"
buf << "\n\n"
buf << build_fancies( Fancy.exclusives )
buf << "\n\n\n"

buf << "## Fancy Cats (#{Fancy.fancies.size})"
buf << "\n\n"
buf << build_fancies( Fancy.fancies )
buf << "\n\n\n"



##################
## step 2 - add fancy cat details / chronic


month = nil
year  = nil
last_date = nil

## start of kitties blockchain / genesis
genesisdate = Date.new( 2017, 11, 23)   ## 2017-11-23


Fancy.each do |fancy|

  key  = fancy.key
  date = fancy.date

  if year != date.year
    buf << "\n"
    buf << "\n"
    buf << "## #{date.year}"
    buf << "\n"
  end

  if month != date.month
    buf << "\n"
    buf << "### #{date.strftime( '%B')}"
    buf << "\n"
  end

  year  = date.year
  month = date.month


  if last_date != date
    buf << "\n"
    buf << date.strftime( '%b %-d, %Y')

    day_count = (date.to_date.jd - genesisdate.jd)+1
    buf << " (#{day_count}d)"
    buf << "\n"
  end
  last_date = date


  line = ""
  name = ""

  line << "- "
  if fancy.special_edition?
    line << "Special Edition "
  elsif fancy.exclusive?
    line << "Exclusive "
  else
  end


  name << fancy.name
  name << " (#{fancy.name_cn})"  if fancy.name_cn   # add chinese name if present

  line << "[**#{name}**]"
  ## line << "(#{kitties_fancy_search_url( key, h )})"

  ## todo/fix: limit/count !!!!
  line << " (#{fancy.limit ? fancy.limit : '?'}"     # add limit if present/known
  ## line << "+#{h[:overflow]}"   if h[:overflow]

  if fancy.ids
    id_links = fancy.ids.map { |id| "[##{id}](#{kitties_kitty_url(id)})" }
    line << " - #{id_links.join(', ')}"
  end
  line << ")"



  if fancy.special_edition?
    line << " Fancy Cat released"
    line << " -- #{fancy.desc}"    if fancy.desc
    line << "."
    line << " #Fancy Cat #Special Edition"
  elsif fancy.exclusive?
    line << " Fancy Cat released"
    line << " -- #{fancy.desc}"    if fancy.desc
    line << "."
    line << " #Fancy Cat #Exclusive"
  else
    line << " Fancy Cat discovered"
    line << " -- #{fancy.desc}"    if fancy.desc
    line << "."
    line << " #Fancy Cat"
  end

  buf << line
  buf << "\n"

  buf << "\n"

  if fancy.recipe && fancy.recipe[:variants]
    fancy.recipe[:variants].each do |variant_key,variant_h|
      buf << "![](#{media_fancy_pic_url( key, variant_key )})"
      buf << "\n"
    end
  else
    buf << "![](#{media_fancy_pic_url( key )})"
    buf << "\n"
  end
end




puts buf


File.open( "./updates/FANCIES.md", 'w:utf-8' ) do |f|
  f.write buf
end

puts "Done."
