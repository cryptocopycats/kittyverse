# encoding: utf-8


class GenesPage

def build
  buf = ""
  buf << "# Genes (#{TRAITS.keys.size} x 4)\n\n"

  headings = []
  TRAITS.values.each do |trait|
    headings << "#{trait[:name]} (#{trait[:genes]})"
  end

  buf << headings.join( " • " )
  buf << "\n\n"


  TRAITS.values.each do |trait|

    puts "Kai	 Name"
    items = []
    Kai::ALPHABET.each do |kai|
      value = trait[:kai][kai]
      code  = "#{trait[:code]}%02d" % Kai::NUMBER[kai]   ## e.g. FU00, FU01, FU02, etc.
      if value =~ /_[0-9a-z]$/
        if value.start_with?( "totesbasic" )  ## note: special case for three totesbasic traits
        else
          value = '?'
        end
      end
      items << [kai, code, value]
    end

    items.each do |item|
      puts "#{item[0]} #{item[1]} #{item[2]}"
    end

    buf << "## #{trait[:name]} (#{trait[:code]}) - Genes #{trait[:genes]}\n\n"
    buf << make_table( items )
    buf << "\n\n"
  end

  puts buf

  buf
end ## method build



def make_table( items )
  rows = make_rows( items, columns: 2 )    ## was 4
  pp rows

  buf = ""
  buf << "|Kai|Code|Name         |Kai|Code|Name        |\n"
  buf << "|--:|---:|-------------|--:|---:|------------|\n"

  rows.each do |row|
    buf << "| "

    parts = row.map do |item|
      kai  = item[0]
      name = item[2]

      if name == '?'
        cattribute = "?"
      else
        if name.start_with?( "totesbasic" )  ## note: special case for three totesbasic traits
          q = "totesbasic"
        else
          q = name
        end
        cattribute = "**[#{name}](#{kitties_search_url(q)})** #{MEWTATION_LEVEL[kai]}"
      end

      "#{item[0]} | #{item[1]} | #{cattribute}"
    end

    buf << parts.join( " | " )
    buf << " |\n"
  end

  buf
end


## helpers
def make_rows( items, columns: 2 )
  offset = items.size / columns
  pp offset

  rows = []
  offset.times.with_index do |row|
    ## note: construct [items[row],items[offset+row],items[offset*2+row], ...]
    rows << columns.times.with_index.map { |col| items[offset*col+row] }
  end
  rows
end


  def save( path )
    File.open( path, "w:utf-8" ) do |f|
      f.write build
    end
  end

end # class GenesPage