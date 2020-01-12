# encoding: utf-8


class Fancy

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


  def self.special_editions  # special edition fancies
    @@fancies_by_key.values.select { |fancy| fancy.special_edition? }
  end
  def self.exclusives        # exclusive fancies
    @@fancies_by_key.values.select { |fancy| fancy.exclusive? }
  end
  def self.fancies           # "normal" fancies
    @@fancies_by_key.values.select { |fancy| fancy.recipe? }
  end

  def self.breedable         ## todo: find a better name (or add alias) e.g. use unlocked why? why not?
    today = Date.today
    @@fancies_by_key.values.select { |fancy| fancy.breedable?( today ) }
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
                :ids,
                :time_start,
                :time_end

  def initialize( **kwargs )
    @exclusive = @specialedition = @recipe = nil
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

  def overflow?() @count && @limit && @count > @limit; end
  def overflow()  @count - @limit; end   ## todo: check for count limit set - why? why not?
  def limit?()    @limit; end
  def count?()    @count; end

  def time?()     @time_start && @time_end; end  ## is fancy(recipe,specialedition) time windowed? true/false

  def time_days() (@time_end.jd - @time_start.jd) + 1; end


  def unlocked?( today=Date.today )
    if @recipe
      if @recipe.time?   ## time windowed recipe
        if @recipe.time_end >= today
          true
        else
          false
        end
      else  ## assume limit
        if @count && @count < @limit
          true
        else
          false
        end
      end
    else
      false
    end
  end

  alias_method :breedable?, :unlocked?

  def locked?( today=Date.today ) !unlocked?( today ); end


  ###########################################
  ## auto-fill fancies
  FANCIES.each do |key,h|

    name    = h[:name]
    name_cn = h[:name_cn]   # add chinese name if present

    date_str = h[:date]
    date_str = h[:recipe][:time][:start]         if date_str.nil? && h[:recipe]
    date_str = h[:specialedition][:time][:start] if date_str.nil? && h[:specialedition]

    date = Date.strptime( date_str, '%Y-%m-%d' )

    attribs = {
      key:       key,
      name:      name,
      name_cn:   name_cn,
      date:      date,
      desc:      h[:desc]
    }

    attribs = if h[:exclusive]
                attribs.merge( exclusive: true,
                               limit:     h[:exclusive][:limit],
                               ids:       h[:exclusive][:ids] )
              elsif h[:specialedition]
                attribs.merge( specialedition: true,
                               limit:          h[:specialedition][:limit],
                               time_start:     h[:specialedition][:time] && h[:specialedition][:time][:start] ? Date.strptime( h[:specialedition][:time][:start], '%Y-%m-%d' ) : nil,
                               time_end:       h[:specialedition][:time] && h[:specialedition][:time][:end]   ? Date.strptime( h[:specialedition][:time][:end],   '%Y-%m-%d' ) : nil )
              else ## assume "normal/regular" fancy with recipes
                pp h[:recipe]
                recipe = Recipe.new(
                          traits:     h[:recipe][:traits],      ## todo/fix: turn strings into trait objs!!!!
                          variants:   h[:recipe][:variants],    ## todo/fix: turn variant hash into variant ??? - why? why not?
                          limit:      h[:recipe][:limit],
                          time_start: h[:recipe][:time] && h[:recipe][:time][:start] ? Date.strptime( h[:recipe][:time][:start], '%Y-%m-%d' ) : nil,
                          time_end:   h[:recipe][:time] && h[:recipe][:time][:end] && h[:recipe][:time][:end] != '?' ? Date.strptime( h[:recipe][:time][:end],   '%Y-%m-%d' ) : nil )

                ## note: support overflow "shortcut" - overflow+limit => count
                count = if h[:recipe][:overflow]
                          recipe.limit + h[:recipe][:overflow]
                        else
                          h[:recipe][:count]
                        end

                attribs.merge( recipe:     recipe,
                               limit:      recipe.limit,
                               time_start: recipe.time_start,
                               time_end:   recipe.time_end,
                               count:      count )
              end


    fancy = Fancy.new( **attribs )
    ## pp fancy

    ## note: key MUST be a symbol (NOT a string)
    fancies_by_key[key] = fancy

    ## note: downcase name and remove all spaces e.g. Bug Cat => bugcat
    fancies_by_name[name.gsub( / /, '' ).downcase] = fancy
    fancies_by_name[name_cn] = fancy if name_cn   ## add chinese name too if present
  end

end # class Fancy
