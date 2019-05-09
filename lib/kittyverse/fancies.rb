# encoding: utf-8


class Fancy

  def self.special_editions()  @@special_editions  ||= []; end  # special edition fancies
  def self.exclusives()        @@exclusives        ||= []; end  # exclusive fancies
  def self.fancies()           @@fancies           ||= []; end  # "normal" fancies



  def self.fancies_by_key()  @@fancies_by_key  ||= {}; end
  def self.fancies_by_name() @@fancies_by_name ||= {}; end

  def self.find_by_key( key )
    ## note: use (always) a **symbol** for key lookup for now
    @@fancies_by_key[ key.downcase.to_sym ]
  end

  def self.find_by_name( name )
    ## note: allow string AND symbols (thus, use .to_s !!!)
    ##       allow spaces e.g. Bug Cat is the same as BugCat
    ## note: downcase name e.g. allow BugCat too (not just Bug Cat)
    @@fancies_by_name[ name.gsub( / /, '' ).downcase.to_s ]
  end

  ## add "generic" convenience find helper
  def self.find_by( **kwargs )
    if kwargs[ :key ]
       find_by_key( kwargs[ :key ] )
    elsif kwargs[ :name ]
      find_by_name( kwargs[ :name] )
    else
      ## todo/fix: throw argument except!!!
      nil
    end
  end

  def self.[]( key )
    if key.is_a? Symbol    ## e.g. :genesis, :bugcat, etc.
        f = find_by_key( key )
        f = find_by_name( key )   if f.nil?  ## try fancy name next - why? why not?
        f
    else ## assume string
        f = find_by_name( key )   ## search by key next - why? why not?
        f
    end
  end


  def self.each
    @@fancies_by_key.each do |(key,fancy)|
      yield( fancy )
    end
  end

  def self.size() @@fancies_by_key.size; end  ## todo: add length alias too? why? why not?





  attr_accessor :key,
                :name,
                :name_cn,
                :date,
                :desc,
                :exclusive,
                :specialedition,
                :recipe,
                :count,
                :limit,
                :ids

  def initialize( **kwargs )
    update( kwargs )
  end

  def update( **kwargs )
    kwargs.each do |name,value|
      send( "#{name}=", value ) ## use "regular" plain/classic attribute setter
    end
    self   ## return self for chaining
  end

  def exclusive?()        @exclusive.nil? == false; end
  def specialedition?()   @specialedition.nil? == false; end
  alias_method :special_edition?, :specialedition?
  def recipe?()           @recipe.nil? == false; end



  ## auto-fill
  FANCIES.each do |key,h|

    date_str = h[:date]
    date_str = h[:recipe][:time][:start]         if date_str.nil? && h[:recipe]
    date_str = h[:specialedition][:time][:start] if date_str.nil? && h[:specialedition]

    date = Date.strptime( date_str, '%Y-%m-%d' )


    name =    h[:name]
    name_cn = h[:name_cn]   # add chinese name if present
    desc    = h[:desc]

    exclusive      = h[:exclusive]
    specialedition = h[:specialedition]
    recipe         = h[:recipe]

    attribs = {
      key:       key,
      date:      date,
      name:      name,
      name_cn:   name_cn,
      desc:      desc,
      exclusive: exclusive,
      specialedition: specialedition,
      recipe:    recipe,
    }


    ## todo: check for overflow  - if overflow use limit+overflow = count
    ##   add traits and time windows
    if exclusive
      attribs = attribs.merge( limit: h[:exclusive][:limit],
                               count: h[:exclusive][:count],
                               ids:   h[:exclusive][:ids] )
    elsif specialedition
      attribs = attribs.merge( limit: h[:specialedition][:limit],
                               count: h[:specialedition][:count] )
    else  ## assume "normal/regular" fancy with recipes
      attribs = attribs.merge( limit: h[:recipe][:limit],
                               count: h[:recipe][:count] )
    end


    fancy = Fancy.new( **attribs )
    pp fancy

    if fancy.exclusive?
      exclusives << fancy
    elsif fancy.special_edition?
      special_editions << fancy
    else  ## assume "normal/regular" fancy (with recipe)
      fancies << fancy
    end


    ## note: key MUST be a symbol (NOT a string)
    fancies_by_key[key] = fancy

    ## note: downcase name and remove all spaces e.g. Bug Cat => bugcat
    fancies_by_name[name.gsub( / /, '' ).downcase] = fancy
    fancies_by_name[name_cn] = fancy if name_cn   ## add chinese name too if present
  end

end # class Fancy
