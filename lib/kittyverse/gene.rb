# encoding: utf-8


class Gene

### todo/check:
##    find a better name for Slice(incl.4 genes)
##      e.g. GeneFour, Gene4, GeneGroup, GeneSlice,TraitGenes,... - why? why not?

class Slice   ## Gene::Slice (nested class)

  attr_reader :type   # trait type (tt)
  attr_reader :d, :r1, :r2, :r3
  # d  (dominant gene)    -- todo/check: rename to just d instead of d0 - why? why not?
  # r1 (1st order recessive gene)
  # r2 (2nd order recessive gene)
  # r3 (3rd order recessive gene)

  ## compat: add alias for ("new/modern") p, h1, h2, h3
  ##    p(rimary), h(idden) 1, h(idden) 2, h(idden) 3
  alias_method :p,  :d
  alias_method :h1, :r1
  alias_method :h2, :r2
  alias_method :h3, :r3


  def initialize( type, d, r1, r2, r3 )
    @type = TraitType[type]   ## lookup trait type by key (e.g. :body, :pattern, etc.)
    @d    = @type[d]          ## lookup trait (from trait type) by kai code (e.g. "1", "a", etc.)
    @r1   = @type[r1]
    @r2   = @type[r2]
    @r3   = @type[r3]
  end

  def to_kai
    @r3.kai + @r2.kai + @r1.kai + @d.kai
  end   ## return a string in kai/base32 notation

end  # class Slice
end  # class Gene
