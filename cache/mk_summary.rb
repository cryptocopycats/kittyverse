require 'json'
require 'date'
require 'time'



def calc_stat( datafiles )
  stat = {
      count: 0,
      min_id: 999_999_999,
      max_id: 0,
      min_date: Date.new( 2999, 1, 1 ),
      max_date: Date.new( 1999, 1, 1 ),
      variants: Hash.new(0), ## count of variants
  }

  datafiles.each do |datafile|
     stat[:count] += 1
     data = JSON.parse( File.open( datafile, 'r:utf-8') {|f| f.read } )
     id = data['id']
     ##  "birthday": "2017-11-23T00:00:00.000Z",
     birthday = Date.strptime( data['birthday'], '%Y-%m-%d' )
     stat[:min_date] = birthday   if birthday < stat[:min_date]
     stat[:max_date] = birthday   if birthday > stat[:max_date]

     stat[:min_id] = id   if id < stat[:min_id]
     stat[:max_id] = id   if id > stat[:max_id]

     ### counts of variants
     variation = data['variation']
     stat[:variants][ variation ] += 1  if variation
  end

  stat
end


def collect_stats( dir )
  subdirs = Dir.entries( dir ).select do |name|
    if File.directory?( "#{dir}/#{name}" )
       ['.git', '.', '..'].include?( name ) ? false : true
    else
     false
    end
  end
  pp subdirs

  stats = []
  subdirs.each do |name|
     datafiles = Dir.glob( "#{dir}/#{name}/**/*.json")
     ## puts "#{datafiles.size} datafile(s) - #{name}"
     ## pp datafiles[0]
     stat = calc_stat( datafiles )
     ## add name etc.
     stat[:name] = name
     stats << stat
  end
  stats
end


def render_summary( dir, header:  )
  stats = collect_stats( dir )
  stats = stats.sort do |l,r|
                        res = l[:min_date] <=> r[:min_date]
                        res = l[:min_id]   <=> r[:min_id]  if res == 0
                        res
                     end

  pp stats
  buf = String.new('')
  buf << header
  buf << "\n\n"

  buf << "| Count | Name | IDs (Min/Max) | Date (Min/Max) | Notes    |\n"
  buf << "|------:|------|---------------|----------------|----------|\n"

  stats.each do |stat|
    buf << "| #{stat[:count]} "
    buf << "| [**#{stat[:name]}**](#{stat[:name]}) "
    if stat[:count] == 1
      buf << "| #{stat[:min_id]} "
    else
      buf << "| #{stat[:min_id]} / #{stat[:max_id]} "
    end
    if stat[:min_date] == stat[:max_date]
      buf << "| #{stat[:min_date]} "
    else
      buf << "| #{stat[:min_date]} / #{stat[:max_date]} "
    end

    if stat[:variants].size > 0
      buf << "| "
      buf << stat[:variants].map {|k,v| "#{k} (#{v})"}.join( ' · ' )
    end

    buf << "|\n"
  end

  buf << "\n\n"
  buf
end

def save_summary( dir, header:  )
  buf = render_summary( dir, header: header )
  puts buf

  File.open( "#{dir}/README.md", 'w:utf-8' ) { |f| f.write( buf ) }
end


out_dir = '../../cache.kitties.json'

save_summary( "#{out_dir}/exclusive", header: "# Exclusives" )
save_summary( "#{out_dir}/special", header: "# Special Editions" )
save_summary( "#{out_dir}/fancy", header: "# Fancies" )
save_summary( "#{out_dir}/shinyfancy", header: "# Shiny Fancies" )
save_summary( "#{out_dir}/prestige", header: "# Prestige Cattributes" )

puts "bye"