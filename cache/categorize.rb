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

  datafiles = Dir.glob( "#{out_dir}/**/*.json" )
  puts "   #{datafiles.size} datafile(s)"

  datafiles.each_with_index do |datafile,i|
     print "[#{i+1}]"
     text = File.open( datafile, 'r:utf-8') { |f| f.read }
     data = JSON.parse( text )



     new_out_dir = nil
     basename    = nil

     kitty_type = data['kitty_type']
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


      basename = String.new( '' )

      fancy_ranking = data['fancy_ranking']
      if fancy_ranking
        basename << "#{fancy_ranking}"

        variation_ranking = data['variation_ranking']
        if variation_ranking
          basename << "_#{variation_ranking}"
        end

        basename << "-"
      end
      basename << "#{data['id']}"
    else
      new_out_dir = "#{out_dir}/normal"
      basename    = "#{data['id']}"
    end


    new_path = "#{new_out_dir}/#{basename}.json"

      ## note: only move if new file (lets you rerun)
      unless File.exist?( new_path )
        FileUtils.mkdir_p( new_out_dir )  ## make sure path exits
        puts "  move to >#{new_path}<"
        File.rename( datafile, new_path )
      end
  end
end



categorize()

puts "bye"