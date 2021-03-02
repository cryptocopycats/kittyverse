####
# use:
#  $ ruby -I ../kittyverse-api/lib -I ../kittyverse/lib categorize.rb


require_relative 'helper'


FANCY_TYPES_CN =
{
  '旺财汪' => 'GoldenDogCat',
  '帝龙喵' => 'GoldenDragonCat',
}


def categorize
  ## out_dir = "./dl"
  out_dir = "../../cache.kitties.json"

  ## datafiles = Dir.glob( "#{out_dir}/**/*.json" )
  datafiles = Dir.glob( "#{out_dir}/*.json" )  ## to speed-up check only "top-level" datafiles
  puts "   #{datafiles.size} datafile(s)"

  datafiles.each_with_index do |datafile,i|
     print "[#{i+1}]"
     text = File.open( datafile, 'r:utf-8') { |f| f.read }
     data = JSON.parse( text )



     new_out_dir = nil

     basename = String.new( '' )
     basename << ('%06d@%d' % [data['id'],data['generation']])


     kitty_type    = data['kitty_type']
     prestige_type = data['prestige_type']

     if kitty_type

      fancy_type = nil
      if data['language'] != 'en'
        fancy_type = FANCY_TYPES_CN[ data['fancy_type'] ]
        if fancy_type.nil?
          puts "!! ERROR:  no english fancy_type name translation found for kitty:"
          pp data
          exit 1
        end
      else
        fancy_type = data['fancy_type']
      end
      fancy_type = fancy_type.downcase



      new_out_dir = "#{out_dir}/#{kitty_type}/#{fancy_type}"

      variation = data['variation']
      if variation
         new_out_dir << "/#{variation}"
      end


      fancy_ranking = data['fancy_ranking']
      if fancy_ranking
        basename << "_(#{fancy_ranking}"

        variation_ranking = data['variation_ranking']
        if variation_ranking
          basename << "-#{variation_ranking}"
        end
        basename << ")"
      end
    elsif prestige_type
      prestige_type = prestige_type.downcase
      new_out_dir = "#{out_dir}/prestige/#{prestige_type}"

      prestige_ranking = data['prestige_ranking']
      if prestige_ranking
        basename << "_(#{prestige_ranking})"
      end
    else
      new_out_dir = "#{out_dir}/normal"

      ## file by blocks fo 100_000
      ##   e.g. 1-99_999
      ##        100_000-199_999
      ##        200_000-299_999
      id = data['id']
      block = id / 100_000

      if block == 0  ## special case (starting with 1 NOT 0)
        new_out_dir << "/1-99999"
      else
        new_out_dir << "/#{100_000*block}-#{100_000*block+99_999}"
      end

      ## and by blocks of 100 subblock of 1000
      ##   e.g. 000/001/002)
      subblock = id / 1000
      new_out_dir << ('/%03d' %  subblock )
    end


    new_path = "#{new_out_dir}/#{basename}.json"

      ## note: only move if new file (lets you rerun)
      if File.exist?( new_path )
         puts "!! WARN - already exits >#{new_path}<:"
         pp datafile

         ## move to trash
         File.rename( new_path, "#{out_dir}/trash/#{File.basename( new_path )}" )
      end

      FileUtils.mkdir_p( new_out_dir )  ## make sure path exits
      puts "  move to >#{new_path}<"
      File.rename( datafile, new_path )

  end
end



categorize()

puts "bye"