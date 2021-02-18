

class TimelineFanciesPage

HEADER =<<TXT
[2021](#2021) •
[2020](#2020) •
[2019](#2019) •
[2018](#2018) •
[2017](#2017)

# Updates - Fancy / Exclusive / Special Edition Cats - Timeline

see <https://updates.cryptokitties.co>


TXT



###
# sort fancies by date - latest first / reverse chronological order
FANCY_BY_DATE = begin
                  fancies = []
                  Fancy.each { |fancy| fancies << fancy }
                  ## note: sort by recipe date if present?
                  fancies.sort do |l,r|
                    r.date <=> l.date
                  end
                end


def build
  buf = ""
  buf << HEADER

  special_editions = Fancy.special_editions
  exclusives       = Fancy.exclusives
  fancies          = Fancy.fancies

  buf << "## Special Edition Cats (#{special_editions.size})"
  buf << "\n\n"
  buf << build_fancies( special_editions )
  buf << "\n\n"
  buf << build_fancies_media( special_editions )
  buf << "\n\n"

  buf << "## Exclusive Cats (#{exclusives.size})"
  buf << "\n\n"
  buf << build_fancies( exclusives )
  buf << "\n\n"
  buf << build_fancies_media( exclusives )
  buf << "\n\n"

  buf << "## Fancy Cats (#{fancies.size})"
  buf << "\n\n"
  buf << build_fancies( fancies )
  buf << "\n\n"
  buf << build_fancies_media( fancies )
  buf << "\n\n"

##################
## step 2 - add fancy cat details / chronic

month = nil
year  = nil
last_date = nil

## start of kitties blockchain / genesis
genesisdate = Date.new( 2017, 11, 23)   ## 2017-11-23


FANCY_BY_DATE.each do |fancy|

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

    day_count = (date.jd - genesisdate.jd)+1
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


  ## special case for time-windows special editions
  if fancy.specialedition? && fancy.time?
    time_window = build_time_window( fancy )
    buf << "  - #{time_window}"
    buf << "\n"
  end


  if fancy.recipe?
    buf << "  - **#{fancy.recipe.traits.size}** traits"
    buf << " + **#{fancy.recipe.variants.size}** variants"  if fancy.recipe.variants

    if fancy.recipe.time?   ## time windowed recipe
      time_window = build_time_window( fancy.recipe )
      buf << " - #{time_window}"
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
end
  buf

end # method build



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


def build_fancy_counter( fancy, show_time: false )
  buf = ""

  if fancy.recipe?
    if fancy.recipe.time?   ## time windowed recipe
      if fancy.recipe.time_end >= Date.today
        buf << "![](#{media_icon_url(:unlocked)})"
        if fancy.count     # add count if present/known
          buf << "#{fancy.count}+"
        else
          buf << "?"
        end
        if show_time
          buf << "/Till: #{fancy.recipe.time_end.strftime( '%b %-d %Y')}"
        end
      else
        buf << "#{fancy.count ? fancy.count : '?'}"     # add count if present/known
      end
    elsif fancy.recipe &&
          fancy.recipe.time_start &&   ## time window BUT unknown end date
          fancy.recipe.time_end.nil?
      if fancy.count     # add count if present/known
        buf << "#{fancy.count}+"
      else
        buf << "?"
      end
    else  ## assume limit
      if fancy.count && fancy.count < fancy.limit
        buf << "![](#{media_icon_url(:unlocked)})"
        if fancy.count <= 0
          buf << '?'
        else
          buf << "#{fancy.count}+"
        end
        buf << "/#{fancy.limit}"     # add limit if present/known
      else
        buf << "#{fancy.limit ? fancy.limit : '?'}"
        buf << "+#{fancy.overflow}"     if fancy.overflow?
      end
    end
  else
    ## note: fow now exclusive and specialeditions always have a limit
    ##          and do NOT use counts   (- use count for (time-windowed) specialeditions - why? why not?)
    buf << "#{fancy.limit ? fancy.limit : '?'}"     # add limit if present/known
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
  line << build_fancy_counter( fancy, show_time: true )
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
      name = "#{fancy.name} #{variant_h[:name]}"

      buf << %Q{![#{name}](#{media_fancy_pic_url( fancy.key, variant_key )} "#{name}")}
      buf << "\n"
    end
  else
    name = "#{fancy.name}"
    name << " (#{fancy.name_cn})" if fancy.name_cn

    buf << %Q{![#{name}](#{media_fancy_pic_url( fancy.key )} "#{name}")}
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
  trait = Trait[ key ]
  ## pp trait
  if trait.nil?
    puts "!! ERROR: cannot find trait with key: >#{key}<"
    exit 1
  end

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

end # class TimelineFanciesPage


