# encoding: utf-8



class Cattributes
  ## add cattributes (traits) type lookup to Cattribute itself - why? why not?
  def self.[]( key )  TraitType.find_by_key( key ).cattributes; end
end


class Cattribute

  def self.cattributes_by_name()  @@cattributes_by_name ||= {}; end

  def self.find_by_name( name )
    ## note: allow string AND symbols (thus, use .to_s !!!)
    ## note: downcase name e.g. allow Savannah too (not just savannah)
    @@cattributes_by_name[ name.downcase.to_s ]
  end

  ## add "generic" convenience find helper
  def self.find_by( **kwargs )
    if kwargs[ :name ]
       find_by_name( kwargs[ :name ] )
    else
      ## todo/fix: throw argument except!!!
      nil
    end
  end

  def self.[]( name ) find_by_name( name ); end



  attr_accessor :type,
                :key,
                :name,
                :traits,
                :recipe,
                :count

  def initialize( **kwargs )
    update( kwargs )
  end

  def update( **kwargs )
    kwargs.each do |name,value|
      send( "#{name}=", value ) ## use "regular" plain/classic attribute setter
    end
    self   ## return self for chaining
  end



  ## autofill cattributes
  TraitType.each do |tt|
    key = tt.key
    puts "key: #{key}"

    tt.cattributes ||= []    ## if nil make sure it's an empty array when starting
    ## pp tt

    next if [:secret, :prestige].include?( key)

    tt.traits.each do |t|
      ## 1) skip "unnamed" traits
      next if t.name.nil?

      pp t.name

      ## 2) special case for totesbasic - one cattribute, three traits
      ##      (that is, Totesbasic 1, Totesbasic 2, Totesbasic 3)
      if TOTESBASIC.include?( t.name )
        if t.name == TOTESBASIC.first
          t1 = Traits[ TOTESBASIC[0] ]
          t2 = Traits[ TOTESBASIC[1] ]
          t3 = Traits[ TOTESBASIC[2] ]

          cattribute = Cattribute.new(
                           key:    'totesbasic'.to_sym,
                           name:   'Totesbasic',
                           type:   tt,
                           traits: [t1,t2,t3]
                         )
        else
          next ## skip all other totesbasic traits
        end
      else
        cattribute = Cattribute.new(
                         key:    t.name.to_sym,
                         name:   t.name,
                         type:   tt,
                         traits: [t]
                       )
        ## pp cattribute
      end

      tt.cattributes << cattribute

      cattributes_by_name[ cattribute.name.downcase ] = cattribute
    end
  end

  ## add purrstiges traits
  tt = Traits[:prestige]
  tt.cattributes ||= []    ## if nil make sure it's an empty array when starting
  PURRSTIGES.each do |key, h|
    puts "key: #{key}"
    pp h

    recipe = Recipe.new(
              traits:     h[:recipe][:traits],      ## todo/fix: turn strings into trait objs!!!!
              limit:      h[:recipe][:limit],
              time_start: h[:recipe][:time] && h[:recipe][:time][:start] ? Date.strptime( h[:recipe][:time][:start], '%Y-%m-%d' ) : nil,
              time_end:   h[:recipe][:time] && h[:recipe][:time][:end] && h[:recipe][:time][:end] != '?'  ? Date.strptime( h[:recipe][:time][:end],   '%Y-%m-%d' ) : nil )

    cattribute = Cattribute.new(
                     key:    key,
                     name:   h[:name],
                     type:   tt,
                     traits: [],  ## empty traits
                     count:  h[:recipe][:count],   # note: add count from recipe hash (NOT incl. in recipe struct)
                     recipe: recipe
                   )
    tt.cattributes << cattribute

    cattributes_by_name[ cattribute.name.downcase ] = cattribute
  end


end # class Cattribute
