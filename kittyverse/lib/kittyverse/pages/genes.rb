# encoding: utf-8


class GenesPage

def build
  buf = ""
  buf << "# Genes (#{TraitType.size} x 4)\n\n"

  headings = []
  TraitType.each do |tt|
    anchor = "#{tt.name} #{tt.code}".downcase.gsub( ' ', '-' )
    headings << "[#{tt.name} (#{tt.code})](##{anchor})"
  end

  buf << headings.join( " • " )
  buf << "\n\n"


  TraitType.each do |tt|
    buf << "## #{tt.name} (#{tt.code})\n\n"
    buf << "_Genes #{tt.genes}_\n\n"
    buf << make_table( tt.traits )
    buf << "\n\n"
  end

  puts buf

  buf
end ## method build



def make_table( traits )
  rows = make_rows( traits, columns: 2 )    ## was 4
  ## pp rows

  buf = ""
  buf << "|Kai|Code|Name         |Kai|Code|Name        |\n"
  buf << "|--:|---:|-------------|--:|---:|------------|\n"

  rows.each do |row|
    buf << "| "

    parts = row.map do |trait|
      kai    = trait.kai
      ## binary = "%05b" % Kai::NUM[kai]
      code   = trait.code
      name   = trait.name
      tier   = trait.tier_roman   ## e.g. I,II,III, etc. : String

      if name.nil?
        ## note: so far x/31 trait is unknown/undefined!!!
        if kai == "x"
          cattribute = "?"
        elsif trait.type.key == :secret
          cattribute = "? #{tier}"    ## unknown unknown
        else  ## "anonymous / unnamed" gene / trait
          cattribute = "∅ #{tier}"    ## known unknown :-)
        end
      else
        if name.downcase.start_with?( "totesbasic" )  ## note: special case for three totesbasic traits
          q = "totesbasic"
        else
          q = name
        end
        cattribute = "**[#{name}](#{kitties_search_url(q)})** #{tier}"
      end

      "#{kai} | #{code} | #{cattribute}"
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
