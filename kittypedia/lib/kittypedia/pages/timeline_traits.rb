

class TimelineTraitsPage

HEADER = <<TXT
# Updates - Traits / Cattributes / Mewtations - Timeline

see <https://updates.cryptokitties.co>

TXT


  def build
## check traits if all known
TRAITS_TIMELINE.each do |key,h|

  ## double check traits if present / known / defined
  trait = Trait.find_by_name( key.to_s )
  if trait.nil?
    puts "unknown / undefined trait #{key}:"
    pp h
    exit 1
  end
end


buf = ""
buf << HEADER


month = nil
year  = nil
last_date = nil

## start of kitties blockchain / genesis
genesisdate = Date.new( 2017, 11, 23)   ## 2017-11-23


TRAITS_TIMELINE.each do |key,h|
  date = Date.strptime( h[:date], '%Y-%m-%d' )

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



  trait      = Trait.find_by_name( key.to_s )
  trait_type = trait.type

  kai        = trait.kai
  tier       = trait.tier        #  0,1,2,3,4,nil
  tier_roman = trait.tier_roman


  line = ""
  name = "#{key}"   ## todo/fix: upcase first letter - why? why not?

  line << "- "
  line << "[**#{name}**](#{kitties_search_url(name)}) #{tier_roman} "

  line << " - #{trait_type.name.downcase} "

  pair = MUTATION_PAIR[kai]

  kai_pair = "#{kai}"
  kai_pair << " = #{pair}"   unless pair.empty?

  line << "(#{trait.code} / #{kai_pair}) "

  line << "trait discovered. #Cattribute"
  line << " #Mewtation"       if tier && tier > 0


  buf << line
  buf << "\n"
end
buf
end # method build

end # class TimelineTraitsPage



