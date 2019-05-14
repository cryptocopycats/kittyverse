# encoding: utf-8

####
# use:
#  $ ruby -I ./lib script/purrstiges.rb



require 'kittyverse'



buf = ""
buf += <<TXT
[2019](#2019) •
[2018](#2018)

# Updates - Purrstige Trait Recipes / Formulas  - Timeline

see <https://updates.cryptokitties.co>


TXT



def build_time_window( o )
  buf = ""
  if o.time_start.year == o.time_end.year
    buf << o.time_start.strftime( '%b %-d')
  else   # include year
    buf << o.time_start.strftime( '%b %-d %Y')
  end

  buf << " - "
  buf << o.time_end.strftime( '%b %-d %Y')
  buf << " (#{o.time_days}d)"
  buf
end


def build_prestige_counter( prestige, show_time: false )
  buf = ""

  if prestige.recipe.time_end >= Date.today
    buf << "![](#{media_icon_url(:unlocked)})"
    if prestige.count     # add count if present/known
      buf << "#{prestige.count}+"
    else
      buf << "?"
    end
    if show_time
      buf << "/Till: #{prestige.recipe.time_end.strftime( '%b %-d %Y')}"
    end
  else
    buf << "#{prestige.count ? prestige.count : '?'}"     # add count if present/known
  end
  buf
end

def build_prestige( c )
  name = ""
  name << c.name

  line = "[**#{name}**](##{c.key})"

  line << " (#{build_prestige_counter(c, show_time: true)})"    # add count(er)
  line
end



def build_prestiges
  buf = ""
  Cattributes[:prestige].each do |c|
    buf << build_prestige( c )
    buf << "\n"
  end
  buf
end




buf << "## Purrstige Cattributes (#{Cattributes[:prestige].size})"
buf << "\n\n"
buf << "_Special traits for a limited time only bred through a recipe._"
buf << "\n\n"
buf << build_prestiges()
buf << "\n\n\n"





def build_trait( key )
  puts "lookup trait >#{key}<"
  trait = Trait[ key ]
  ## pp trait

  if key =~ /[A-Z]{2}[0-9]{2}/   # if code e.g. WE20 - keep as is
     line = "**#{key}** #{trait.tier_roman} "

     [line, trait.type.name]
  else
    # rec[:name] = name
    # rec[:kai]  = kai
    # rec[:code] = code
    # rec[:type] = key   ## todo - use trait instead of type  (use string not symbol?) - why? why not?

    line = ""
    line << "**#{trait.name}** #{trait.tier_roman} "
    line << "("
    line << trait.code
    line << ")"

    [line, trait.type.name]
  end
end

def build_traits( key_or_keys )
  if key_or_keys.is_a? Array
    keys = key_or_keys
    tt = ""   ## last trait type  (assume all trait types are the same for now)
    t = keys.map do |key|
      t, tt = build_trait( key )
      t
    end.join(', ')
  else
    key = key_or_keys
    t, tt = build_trait( key )
  end
  "#{t} - #{tt}"   # trait (t) - trait type (tt)
end




month = nil
year  = nil
last_date = nil

## start of kitties blockchain / genesis
genesisdate = Date.new( 2017, 11, 23)   ## 2017-11-23


## buf << "## Purrstige Cattributes"
buf << "\n\n"

Cattributes[:prestige].each do |c|
  key =  c.key
  date = c.recipe.time_start

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

    day_count = (date.jd - genesisdate.jd)+1
    buf << " (#{day_count}d)"
    buf << "\n\n"
  end
  last_date = date


  ## add anchor name
  buf << %Q{\n<a name="#{c.key}">}
  buf << "\n\n"


  name = ""
  name << c.name

  buf << "[**#{name}**]"
  buf << "(#{kitties_search_url( key )}) "

  buf << " (#{build_prestige_counter(c)})"      # add count(er)
  buf << ", "

  time_window = build_time_window( c.recipe )
  buf << "#{time_window}"
  buf << ", "


  buf << " **#{c.recipe.traits.size}** traits:"
  buf << "\n"

  ## traits:
  c.recipe.traits.each do |trait_keys|
    buf << "- "
    buf << build_traits( trait_keys )
    buf << "\n"
  end

  buf << "\n\n"
end





puts buf

File.open( "./updates/PURRSTIGES.md", 'w:utf-8' ) do |f|
  f.write buf
end

puts "Done."
