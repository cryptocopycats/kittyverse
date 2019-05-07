# encoding: utf-8

####
# use:
#  $ ruby -I ./lib script/cattributes2.rb

require 'kittyverse'


pp FANCIES


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
                :name,
                :traits,
                :recipe

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
  TRAITS.each do |key, h|
      puts "key: #{key}"

    tt = Traits[ key ]
    tt.cattributes ||= []    ## if nil make sure it's an empty array when starting
    ## pp tt

    next if [:secret, :prestige].include?( key)

    h[:kai].each do |kai, trait_name|
      ## 1) skip "unnamed" traits
      next if trait_name =~ /_[1-9a-z]$/




      ## 2) special case for totebasic - one cattribute, three traits
      ##      (that is, totesbasic 1, totesbasic 2, totesbasic 3)
      if TOTESBASIC.include?( trait_name )
        if trait_name == TOTESBASIC.first
          t1 = Traits[ TOTESBASIC[0] ]
          t2 = Traits[ TOTESBASIC[1] ]
          t3 = Traits[ TOTESBASIC[2] ]

          cattribute = Cattribute.new(
                           name: 'totesbasic',
                           type: tt,
                           traits: [t1,t2,t3]
                         )
        else
          next ## skip all other totesbasic traits
        end
      else
        t = Traits[trait_name]
        pp t.name

        cattribute = Cattribute.new(
                         name: trait_name,
                         type: tt,
                         traits: [t]
                       )
        ## pp cattribute
      end

      tt.cattributes << cattribute

      cattributes_by_name[ cattribute.name ] = cattribute
    end
  end

  ## add purrstiges traits
  tt = Traits[:prestige]
  tt.cattributes ||= []    ## if nil make sure it's an empty array when starting
  PURRSTIGES.each do |key, h|
    puts "key: #{key}"
    pp h

    cattribute = Cattribute.new(
                     name: key.to_s,
                     type: tt,
                     traits: [],  ## empty traits
                     recipe: h[:recipe]  ## todo/fix: add recipe as a struct (NOT as a hash)
                   )
    tt.cattributes << cattribute

    cattributes_by_name[ cattribute.name ] = cattribute
  end


end # class Cattribute

c = Cattribute.find_by_name( 'savannah' )
pp c.name
pp c.type.name
pp c.traits.size
c = Cattribute.find_by_name( :totesbasic )
pp c.name
pp c.type.name
pp c.traits.size
c = Cattribute.find_by_name( 'bionic' )
pp c.name
pp c.type.name
pp c.traits.size
pp c.recipe

## c = Cattribute.find_by( name: 'bionic' )
c = Cattribute[ 'bionic' ]
pp 
pp c.name
pp c.type.name
pp c.traits.size
pp c.recipe
