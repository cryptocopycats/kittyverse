# encoding: utf-8


class Catalog    ## todo:  use a module - move to its own file -  why? why not?

  @@specials   = {}  # special edition fancies
  @@exclusives = {}  # exclusive fancies
  @@fancies    = {}  # "normal" fancies

  @@prestiges  = {}  # purrstige cattributes


  ## use special_cats, exclusive_cats, etc. - why? why not?
  def self.specials()   @@specials; end
  def self.exclusives() @@exclusives; end
  def self.fancies()    @@fancies; end

  ## use prestige(purrstige)_cattributes - why? why not?
  def self.prestiges()  @@prestiges; end


FANCIES.each do |key,h|
  if h[:special]
    specials[key] = h
  elsif h[:exclusive]
    exclusives[key] = h
  elsif h[:prestige]
    prestiges[key] = h
  else
    fancies[key] = h
  end
end
end # class Catalog
