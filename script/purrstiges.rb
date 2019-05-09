# encoding: utf-8

####
# use:
#  $ ruby -I ./lib script/purrstiges.rb



require 'kittyverse'



buf = ""
buf += <<TXT
# Updates - Purrstige Trait Recipes / Formulas  - Timeline

see <https://updates.cryptokitties.co>


TXT




def build_prestige( key, h )
  name = ""
  name << h[:name]

  line = "[**#{name}**]"
  line << "(#{kitties_search_url( key )})"

  line << " (#{h[:recipe][:count] || '?'}"    # add count if present/known
  line << ")"
  line
end



def build_prestiges
  buf = ""
  PURRSTIGES.each do |key,h|
    buf << build_prestige( key, h )
    buf << "\n"
  end
  buf
end




buf << "## Purrstige Cattributes (#{PURRSTIGES.size})"
buf << "\n\n"
buf << "_Special traits for a limited time only bred through a recipe._"
buf << "\n\n"
buf << build_prestiges()
buf << "\n\n\n"





def build_trait( key )
  puts "lookup trait >#{key}<"
  trait = Traits[ key ]
  ## pp trait

  if key =~ /[A-Z]{2}[0-9]{2}/   # if code e.g. WE20 - keep as is
     line = "**#{key}** #{MEWTATION_LEVEL[trait.kai]} "

     [line, trait.type.name]
  else
    # rec[:name] = name
    # rec[:kai]  = kai
    # rec[:code] = code
    # rec[:type] = key   ## todo - use trait instead of type  (use string not symbol?) - why? why not?

    line = ""
    line << "**#{trait.name}** #{MEWTATION_LEVEL[trait.kai]} "
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

PURRSTIGES.each do |key,h|
  date = Date.strptime( h[:date] || h[:recipe][:time][:start], '%Y-%m-%d' )

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
    buf << "\n\n"
  end
  last_date = date



  time_start = Date.strptime( h[:recipe][:time][:start], '%Y-%m-%d' )
  time_end   = Date.strptime( h[:recipe][:time][:end],   '%Y-%m-%d' )

  time_days  = (time_end.to_date.jd - time_start.to_date.jd) + 1

  name = ""
  name << h[:name]

  buf << "[**#{name}**]"
  buf << "(#{kitties_search_url( key )}) "

  buf << " (#{h[:recipe][:count] || '?'}"      # add count if present/known
  buf << "), "


  if time_start.year == time_end.year
    buf << time_start.strftime( '%b %-d')
  else   # include year
    buf << time_start.strftime( '%b %-d %Y')
  end
  buf << " - "
  buf << time_end.strftime( '%b %-d %Y')
  buf << " (#{time_days}d)"
  buf << ", "


  buf << " **#{h[:recipe][:traits].size}** traits:"
  buf << "\n"

  ## traits:
  h[:recipe][:traits].each do |trait_keys|
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
