# encoding: utf-8

####
# use:
#  $ ruby -I ./lib script/fancies.rb



require 'kittyverse'


buf = ""
buf += <<TXT
[2019](#2019) •
[2018](#2018) •
[2017](#2017)

# Updates - Fancy / Exclusive / Special Edition Cats - Timeline

see <https://updates.cryptokitties.co>


TXT



def build_fancy_counter( fancy )
  buf = ""

  if fancy.recipe?
    ## todo/fix: limit/count !!!!
    if fancy.recipe.time?   ## time windowed recipe
      if fancy.recipe.time_end >= Date.today
        buf << "![](https://cryptocopycats.github.io/media/icons/18x18/unlocked.png)"
        if fancy.count     # add count if present/known
          buf << "#{fancy.count}+"
        else
          buf << "?"
        end
      else
        ## buf << "![](https://cryptocopycats.github.io/media/icons/18x18/locked.png)"
        buf << "#{fancy.count ? fancy.count : '?'}"     # add count if present/known
      end
    else  ## assume limit
      if fancy.count && fancy.count < fancy.limit
        buf << "![](https://cryptocopycats.github.io/media/icons/18x18/unlocked.png)"
        if fancy.count <= 0
          buf << '?'
        else
          buf << "#{fancy.count}+"
        end
        buf << "/#{fancy.limit}"     # add limit if present/known
      else
        ## buf << "![](https://cryptocopycats.github.io/media/icons/18x18/locked.png)"
        buf << "#{fancy.limit ? fancy.limit : '?'}"    # add limit if present/known
      end
    end
  else
    ## todo/fix: limit/count !!!!
    buf << "#{fancy.limit ? fancy.limit : '?'}"     # add limit if present/known
    ## buf << "+#{h[:overflow]}"   if h[:overflow]
  end
  buf
end



def build_fancy( fancy )
  name = ""
  name << fancy.name
  name << " (#{fancy.name_cn})"   if fancy.name_cn   # add chinese name if present

  line = "[**#{name}**]"
  ## line << "(#{kitties_fancy_search_url( fancy )})"
  line << "(##{fancy.key})"

  line << " ("
  line << build_fancy_counter( fancy )
  line << ")"

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


def build_fancy_media( fancy )
  buf = ""
  if fancy.recipe && fancy.recipe.variants
    fancy.recipe.variants.each do |variant_key,variant_h|
      buf << "![#{fancy.name} #{variant_h[:name]}](#{media_fancy_pic_url( fancy.key, variant_key )})"
      buf << "\n"
    end
  else
    buf << "![#{fancy.name}](#{media_fancy_pic_url( fancy.key )})"
    buf << "\n"
  end
  buf
end

def build_fancies_media( fancies )
  buf = ""
  fancies.each do |fancy|
    buf << build_fancy_media( fancy )
  end
  buf
end



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
  pp key_or_keys
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



buf << "## Special Edition Cats (#{Fancy.special_editions.size})"
buf << "\n\n"
buf << build_fancies( Fancy.special_editions )
buf << "\n\n"
buf << build_fancies_media( Fancy.special_editions )
buf << "\n\n"

buf << "## Exclusive Cats (#{Fancy.exclusives.size})"
buf << "\n\n"
buf << build_fancies( Fancy.exclusives )
buf << "\n\n"
buf << build_fancies_media( Fancy.exclusives )
buf << "\n\n"

buf << "## Fancy Cats (#{Fancy.fancies.size})"
buf << "\n\n"
buf << build_fancies( Fancy.fancies )
buf << "\n\n"
buf << build_fancies_media( Fancy.fancies )
buf << "\n\n"



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


  ## add anchor name
  buf << %Q{\n<a name="#{fancy.key}">}
  buf << "\n\n"


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
  line << "(#{kitties_fancy_search_url( fancy )})"


  line << " ("
  line << build_fancy_counter(fancy)

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


  if fancy.recipe?
    buf << "  - **#{fancy.recipe.traits.size}** traits"
    buf << " + **#{fancy.recipe.variants.size}** variants"  if fancy.recipe.variants

    if fancy.recipe.time?   ## time windowed recipe
      buf << " - "
      if fancy.recipe.time_start.year == fancy.recipe.time_end.year
        buf << fancy.recipe.time_start.strftime( '%b %-d')
      else   # include year
        buf << fancy.recipe.time_start.strftime( '%b %-d %Y')
      end

      buf << " - "
      buf << fancy.recipe.time_end.strftime( '%b %-d %Y')

      time_days  = (fancy.recipe.time_end.to_date.jd - fancy.recipe.time_start.to_date.jd) + 1
      buf << " (#{time_days}d)"
    end
    buf << ":"
    buf << "\n"

    ## traits:
    fancy.recipe.traits.each do |trait_keys|
        buf << "    - "
        buf << build_traits( trait_keys )
        buf << "\n"
    end

    if fancy.recipe.variants
        fancy.recipe.variants.each do |variant_key,variant_h|
          buf << "      - **#{variant_h[:name]}** (#{variant_h[:count]}), **#{variant_h[:traits].size}** trait:\n"
          variant_h[:traits].each do |trait_keys|
            buf << "        - "
            buf << build_traits( trait_keys )
            buf << "\n"
          end
        end
    end
  end

  buf << "\n"
  buf << build_fancy_media( fancy )
  buf << "\n"

  buf
end


puts buf


File.open( "./updates/FANCIES.md", 'w:utf-8' ) do |f|
  f.write buf
end

puts "Done."
