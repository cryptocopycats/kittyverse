
class Genome
  def build_tables()   GenomeTables.new( self ).build;  end
end # class Genome


class GenomeTables
  def initialize( genome )
    @genome = genome
  end

  def build
    pos = 0
    buf = ""
    buf << "Genes (256-Bit Integer Number):\n"
    buf << "- Base 10 (Decimal): #{@genome.num}\n"
    buf << "- Base 2 (Binary): #{@genome.binary}\n"
    buf << "- Base 2⁵ = 32\n"
    buf << "  - (Kai):   #{@genome.kai}\n"
    buf << "  - (Codes): #{@genome.codes}\n"
    buf << "\n\n"

    @genome.each do |slice|
      tt = slice.type

      buf << "#{tt.name} (#{tt.code}) - Genes #{tt.genes}\n\n"

###
##   fix/todo: add stars for purity?
##     ****   - all traits the same
##     ***    - two same pairs of traits
##     **     - one pair of same traits

      buf << "|Gene  |Binary   |Kai  |Code | Name     |   |\n"
      buf << "|------|---------|-----|-----|----------|---|\n"
      buf << "| #{pos} | #{slice.d.binary} | #{slice.d.kai} | #{slice.d.code} |**#{fmt_trait(slice.d)}** | d |\n"; pos+=1
      buf << "| #{pos} | #{slice.r1.binary} | #{slice.r1.kai} | #{slice.r1.code} |#{fmt_trait(slice.r1)} | r1 |\n"; pos+=1
      buf << "| #{pos} | #{slice.r2.binary} | #{slice.r2.kai} | #{slice.r2.code} |#{fmt_trait(slice.r2)} | r2 |\n"; pos+=1
      buf << "| #{pos} | #{slice.r3.binary} | #{slice.r3.kai} | #{slice.r3.code} |#{fmt_trait(slice.r3)} | r3 |\n"; pos+=1
      buf << "\n"

      if tt.key == :body    ## add legend for first entry
        buf << "d = dominant, r1 = 1st order recessive, r2 = 2nd order recessive, r3 = 3rd order recessive\n\n"
      end
    end

    buf
  end

####################
## helpers

  def fmt_trait( trait )
    buf = ""
    buf << (trait.name || '∅')
    buf << " #{trait.tier_roman}"    if trait.tier > 0
    buf
  end
end  # class GenomeTables
