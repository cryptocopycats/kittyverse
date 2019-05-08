# encoding: utf-8

####
# use:
#  $ ruby -I ./lib script/fancies.rb



require 'kittyverse'


pp FANCIES


buf = ""
buf += <<TXT
# Updates - Fancy / Exclusive / Special Edition Cats - Timeline

see <https://updates.cryptokitties.co>


TXT




def build_fancy( key, h )
  name = ""
  name << h[:name]
  name << " (#{h[:name_cn]})"  if h[:name_cn]   # add chinese name if present

  line = "[**#{name}**]"
  line << "(#{kitties_fancy_search_url( key, h )})"

  ## todo/fix: limit/count !!!!
  line << " (#{h[:limit] ? h[:limit] : '?'}"    # add limit if present/known
  line << "+#{h[:overflow]}"    if h[:overflow]
  line << ")"
  line
end


def build_fancies( fancies )
  buf = ""
  fancies.each do |key,h|
    buf << build_fancy( key, h )
    buf << "\n"
  end
  buf
end


buf << "## Special Edition Cats (#{Catalog.special_editions.size})"
buf << "\n\n"
buf << build_fancies( Catalog.special_editions )
buf << "\n\n\n"

buf << "## Exclusive Cats (#{Catalog.exclusives.size})"
buf << "\n\n"
buf << build_fancies( Catalog.exclusives )
buf << "\n\n\n"

buf << "## Fancy Cats (#{Catalog.fancies.size})"
buf << "\n\n"
buf << build_fancies( Catalog.fancies )
buf << "\n\n\n"



##################
## step 2 - add fancy cat details / chronic


month = nil
year  = nil
last_date = nil

## start of kitties blockchain / genesis
genesisdate = Date.new( 2017, 11, 23)   ## 2017-11-23


FANCIES.each do |key,h|

  date_str = h[:date]
  date_str = h[:recipe][:time][:start]         if date_str.nil? && h[:recipe]
  date_str = h[:specialedition][:time][:start] if date_str.nil? && h[:specialedition]

  date = Date.strptime( date_str, '%Y-%m-%d' )


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
  if h[:specialedition]
    line << "Special Edition "
  elsif h[:exclusive]
    line << "Exclusive "
  else
  end


  name << h[:name]
  name << " (#{h[:name_cn]})"  if h[:name_cn]   # add chinese name if present

  line << "[**#{name}**]"
  line << "(#{kitties_fancy_search_url( key, h )})"

  ## todo/fix: limit/count !!!!
  line << " (#{h[:limit] ? h[:limit] : '?'}"     # add limit if present/known
  line << "+#{h[:overflow]}"   if h[:overflow]

  if h[:exclusive]
    id_links = h[:exclusive][:ids].map { |id| "[##{id}](#{kitties_kitty_url(id)})" }
    line << " - #{id_links.join(', ')}"
  end
  line << ")"



  if h[:specialedition]
    line << " Fancy Cat released"
    line << " -- #{h[:desc]}"    if h[:desc]
    line << "."
    line << " #Fancy Cat #Special Edition"
  elsif h[:exclusive]
    line << " Fancy Cat released"
    line << " -- #{h[:desc]}"    if h[:desc]
    line << "."
    line << " #Fancy Cat #Exclusive"
  else
    line << " Fancy Cat discovered"
    line << " -- #{h[:desc]}"    if h[:desc]
    line << "."
    line << " #Fancy Cat"
  end

  buf << line
  buf << "\n"

  buf << "\n"

  if h[:recipe] && h[:recipe][:variants]
    h[:recipe][:variants].each do |variant_key,variant_h|
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
