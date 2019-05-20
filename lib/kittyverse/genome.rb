# encoding: utf-8


class Genome
  attr_reader :genes   ## hash of (sliced) genes (key is gene trait type)

  def initialize( arg )
    if arg.is_a? Integer   ## use Integer (Fixnum+Bignum??) - why? why not?
      num = arg
      kai = Kai.encode( num )
    else              # else assume string in kai/base32 format
      kai = arg
      kai = kai.gsub( ' ', '' )   ## allow spaces (strip/remove)
    end
    ## puts "Genome.initialize #{kai}"

    @kai   = kai    ## note: store/save kai without any spaces ("compact" format)
    @genes = build_genes( kai )
  end


  def kai()    Kai.fmt( @kai ); end  # return formatted in blocks of 4
  def bytes()  Kai.bytes( @kai ); end

  def num()    Kai.decode( @kai ); end
  alias_method :to_i, :num

  def electrologica() Electrologica.fmt( Electrologica.encode( num ) ); end  # return formatted in electrologica base32 format
  alias_method :codes, :electrologica

  def binary
    @kai.chars.each_slice(4).map do |slice|
      buf = ""
      buf << Kai::BINARY[slice[0]]
      buf << "-"
      buf << Kai::BINARY[slice[1]]
      buf << "-"
      buf << Kai::BINARY[slice[2]]
      buf << "-"
      buf << Kai::BINARY[slice[3]]
      buf
    end.join( " " )
  end
  alias_method :bin, :binary


  def build_genes( kai )
    kai = kai.reverse    ## note: reserve for easy left-to-right access
    genes = {}   ## hash of genes (key is gene type)
    ## fix/todo: use as_json for "official" api order
    ## note: use insert order from "official" api

##    genes[:body]        = Gene::Slice.new( :body, kai[0],
##                                                   kai[1],
##                                                   kai[2],
##                                                   kai[3] )
##    genes[:pattern]     = Gene::Slice.new( :pattern, kai[4+0],
##                                                      kai[4+1],
##                                                      kai[4+2],
##                                                      kai[4+3]] )

    [:body,      ### todo/fix: use TRAITS.keys or something - why? why not?
     :pattern,
     :coloreyes,
     :eyes,
     :colorprimary,
     :colorsecondary,
     :colortertiary,
     :wild,
     :mouth,
     :environment,
     :secret,
     :prestige].each_with_index do |key,i|
       genes[key] = Gene::Slice.new( key, kai[4*i+0],
                                           kai[4*i+1],
                                           kai[4*i+2],
                                           kai[4*i+3])
    end
    genes
  end


  def body()           @genes[:body]; end
  def pattern()        @genes[:pattern]; end
  def coloreyes()      @genes[:coloreyes]; end
  def eyes()           @genes[:eyes]; end
  def colorprimary()   @genes[:colorprimary]; end
  def colorsecondary() @genes[:colorsecondary]; end
  def colortertiary()  @genes[:colortertiary]; end
  def wild()           @genes[:wild]; end
  def mouth()          @genes[:mouth]; end
  def environment()    @genes[:environment]; end
  def secret()         @genes[:secret]; end
  def prestige()       @genes[:prestige]; end

  alias_method :color1, :colorprimary
  alias_method :color2, :colorsecondary
  alias_method :color3, :colortertiary
  ## todo: add more alias(es) - why? why not?


  def each()            @genes.each { |key,value| yield(value) }; end
  def each_with_index() @genes.each_with_index { |(key,value),i| yield(value,i) }; end


  def build_tables()   GenomeTables.new( self ).build;  end
end # class Genome




class GenomeTables
  def initialize( genome )
    @genome = genome
  end

  def build
    pos = 0
    buf = ""

    @genome.each do |slice|
      buf << "Genes (256-Bit Integer Number):\n"
      buf << "- Base 10 (Decimal): #{@genome.num}\n"
      buf << "- Base 2 (Binary): #{@genome.binary}\n"
      buf << "- Base 2⁵ = 32\n"
      buf << "  - (Kai):   #{@genome.kai}\n"
      buf << "  - (Codes): #{@genome.codes}\n"
      buf << "\n\n"

      tt = slice.type

      buf << "#{tt.name} (#{tt.code}) - Genes #{tt.genes}\n\n"

###
##   fix/todo: add stars for purity?
##     ****   - all traits the same
##     ***    - two same pairs of traits
##     **     - one pair of same traits

      buf << "|Gene  |Binary   |Kai  |Code | Trait    |   |\n"
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
    buf << " #{trait.tier(:roman)}"    if trait.level > 0
    buf
  end
end  # class GenomeTables
