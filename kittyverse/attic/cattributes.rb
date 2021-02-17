
## add cattributes (traits) type lookup to Cattribute itself - why? why not?
class Cattributes
  def self.[]( key )  TraitType.find_by_key( key ).cattributes; end
end



