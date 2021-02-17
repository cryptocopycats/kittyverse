# encoding: utf-8


class Genome

  def initialize( arg )
    if arg.is_a? Integer   ## use Integer (Fixnum+Bignum??) - why? why not?
      num = arg
      kai = Kai.encode( num )
    else
      if arg.downcase.start_with?( '0x' )  ## assume hexstring( base16 )
        kai = Kai.encode( arg.to_i(16) )
      else # else assume string in kai/base32 format
        kai = arg
        kai = kai.gsub( ' ', '' )   ## allow spaces (strip/remove)
      end
    end
    ## puts "Genome.initialize #{kai}"

    @kai   = kai    ## note: store/save kai without any spaces ("compact" format)
    @genes = build_genes( kai )  ## array of (sliced) genes (block of four genes)
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
    genes = []   ## array of (sliced) genes (block of four genes)
    ## fix/todo: use as_json for "official" api order
    ## note: use insert order from "official" api

##    genes << Gene::Slice.new( :body, kai[0],
##                                     kai[1],
##                                     kai[2],
##                                     kai[3] )
##    genes << Gene::Slice.new( :pattern, kai[4+0],
##                                        kai[4+1],
##                                        kai[4+2],
##                                        kai[4+3]] )

    keys.each_with_index do |key,i|
       genes << Gene::Slice.new( key, kai[4*i+0],
                                      kai[4*i+1],
                                      kai[4*i+2],
                                      kai[4*i+3])
    end
    genes
  end


  def body()           @genes[0]; end  ## Fur (FU)
  def pattern()        @genes[1]; end  ## Pattern (PA)
  def coloreyes()      @genes[2]; end  ## Eyes Color (EC)
  def eyes()           @genes[3]; end  ## Eyes Shape (ES)
  def colorprimary()   @genes[4]; end  ## Base Color (BC)
  def colorsecondary() @genes[5]; end  ## Highlight Color (HC)
  def colortertiary()  @genes[6]; end  ## Accent Color (AC)
  def wild()           @genes[7]; end  ## Wild Element (WE)
  def mouth()          @genes[8]; end  ## Mouth (MO)
  def environment()    @genes[9]; end  ## Environment (EN)
  def secret()         @genes[10]; end ## Secret (SE)
  def prestige()       @genes[11]; end ## Purrstige (PU)

  alias_method :color1, :colorprimary
  alias_method :color2, :colorsecondary
  alias_method :color3, :colortertiary
  ## todo: add more alias(es) - why? why not?

  ## add (convenience) alias for two-letter (trait type) codes too
  alias_method :fu, :body
  alias_method :pa, :pattern
  alias_method :ec, :coloreyes
  alias_method :es, :eyes
  alias_method :bc, :colorprimary
  alias_method :hc, :colorsecondary
  alias_method :ac, :colortertiary
  alias_method :we, :wild
  alias_method :mo, :mouth
  alias_method :en, :environment
  alias_method :se, :secret
  alias_method :pu, :prestige


  def each()            @genes.each { |slice| yield(slice) }; end
  def each_with_index() @genes.each_with_index { |slice,i| yield(slice,i) }; end
  alias_method :each_slice,            :each
  alias_method :each_slice_with_index, :each_with_index

  def each_gene
    @genes.each do |slice|
      yield(slice.p)
      yield(slice.r1)
      yield(slice.r2)
      yield(slice.r3)
    end
  end
  def each_gene_with_index
    @genes.each_with_index do |slice,i|
      yield(slice.p,  4*i+0)
      yield(slice.r1, 4*i+1)
      yield(slice.r2, 4*i+2)
      yield(slice.r3, 4*i+3)
    end
  end

  def keys  ##  rename to trait_type_keys - why? why not?
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
     :prestige]
  end

  def index( key )
    if key.size == 2 && key =~ /^[A-Za-z]{2}$/ ## check for codes e.g. FU, PA, ... (or fu, pa,...)
      key = key.upcase.to_sym
      @@codes_by_index ||= %w(FU PA EC ES BC HC AC WE MO EN SE PU)
                           .each_with_index.reduce({}) do |h,(code,i)|
                                                         h[code.to_sym]=i; h
                                                       end
      @@codes_by_index[ key ]
    else
      key = key.downcase.to_sym
      key = ALT_TRAIT_TYPE_KEYS[ key ]  if ALT_TRAIT_TYPE_KEYS[ key ]

      @@keys_by_index ||= keys.each_with_index.reduce({}) do |h,(key,i)|
                                                            h[key]=i; h
                                                          end
      @@keys_by_index[ key ]
    end
  end


  def [](key)
    if key.is_a? Integer   ## assume 0,1,2,3,.. index
      q , r = key.divmod(4)   ## q=quotient, r=rest/modulus
      ##  e.g.   3.divmod(4) => [0,3]
      ##         4.divmod(4) => [1,0]
      ##         5.divmod(4) => [1,1]  etc.
      @genes[q][r]
    else   ## assume trait type key / symbol
      @genes[index(key)]
    end
  end


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
