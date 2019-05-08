# encoding: utf-8


class Catalog    ## todo:  use a module - move to its own file -  why? why not?

  @@special_editions   = {}  # special edition fancies
  @@exclusives         = {}  # exclusive fancies
  @@fancies            = {}  # "normal" fancies


  ## use special_cats, exclusive_cats, etc. - why? why not?
  def self.special_editions()   @@special_editions; end
  def self.exclusives()         @@exclusives; end
  def self.fancies()            @@fancies; end


## auto-fill
FANCIES.each do |key,h|
  if h[:specialedition]
    special_editions[key] = h
  elsif h[:exclusive]
    exclusives[key] = h
  else
    fancies[key] = h
  end
end
end # class Catalog
