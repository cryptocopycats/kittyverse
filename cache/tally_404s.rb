
text = File.read( 'dl/404s.txt')
ids = []
text.each_line do |line|
  line = line.strip
  if line.empty?
    puts "!! WARN: empty line"
    exit 1
  end
  id =  line.to_i
  if id == 0
    puts "!! WARN: cannot convert line to number: >#{line}<"
    exit 1
  end
  ids << id
end

puts "  #{ids.size} ids:"

ranges = []

id_start = -1
id_end   = -1


ids.each do |id|

   if (id_end+1) == id  ## keep going
     id_end = id
     ## puts "[#{id_end}+1==#{id}]"
   else  ## start new range
      if id_start != -1   ## if NOT first time
         ## puts "!! #{id_start}+1 != #{id}"

        if id_start == id_end
          ranges << id_start
        else
          ranges << [id_start, id_end]
        end
      end
      id_start = id
      id_end   = id
   end
end


if id_start == id_end
  ranges << id_start
else
  ranges << [id_start, id_end]
end


puts "ranges:"
pp ranges

