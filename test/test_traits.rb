

t = Traits[ 'FU00' ]
pp t.class    ## Trait
pp t.name
pp t.type.name
pp t.code
pp t.kai

t = Trait.find_by_code( 'FU00' )
pp t.class    ## Trait
pp t.name
pp t.type.name
pp t.code
pp t.kai

t = Trait.find_by( code: 'FU00' )
pp t.class    ## Trait
pp t.name
pp t.type.name
pp t.code
pp t.kai


t = Traits[ 'savannah' ]
pp t.class
pp t.name
pp t.type.name
pp t.code
pp t.kai

t = Traits[ 'Savannah' ]
pp t.class
pp t.name
pp t.type.name
pp t.code
pp t.kai

t = Trait.find_by_name( 'Savannah' )
pp t.class
pp t.name
pp t.type.name
pp t.code
pp t.kai

t = Trait.find_by( name: 'Savannah' )
pp t.class
pp t.name
pp t.type.name
pp t.code
pp t.kai


t = Traits[ :body ][ '1' ]
pp t.class
pp t.name
pp t.type.name
pp t.code
pp t.kai

t = Traits[ :body ][ 'x' ]
pp t.class
pp t.name
pp t.type.name
pp t.code
pp t.kai


t = Traits[ :body ][ '00' ]
pp t.class
pp t.name
pp t.type.name
pp t.code
pp t.kai

t = Traits[ :body ][ '31' ]
pp t.class
pp t.name
pp t.type.name
pp t.code
pp t.kai

t = Traits[ :body ][ 0 ]
pp t.class
pp t.name
pp t.type.name
pp t.code
pp t.kai

t = Traits[ :body ][ 31 ]
pp t.class
pp t.name
pp t.type.name
pp t.code
pp t.kai

t =  Traits[ :body ]
pp t.class   ## TraitType
pp t.name

t =  TraitType.find_by_key( :body )
pp t.class   ## TraitType
pp t.name

t =  TraitType.find_by( :key => :body )
pp t.class   ## TraitType
pp t.name

TraitType.each do |type|
  puts "#{type.key} => #{type.name} (#{type.code}), genes #{type.genes}"
end

Traits.each do |type|
  puts "#{type.key} => #{type.name} (#{type.code}), genes #{type.genes}"
end

t = Traits['FU']['00']
pp t.class    ## Trait
pp t.name
pp t.type.name
pp t.code
pp t.kai

t = Traits['FU'][0]
pp t.class    ## Trait
pp t.name
pp t.type.name
pp t.code
pp t.kai

t = Traits[:FU][0]
pp t.class    ## Trait
pp t.name
pp t.type.name
pp t.code
pp t.kai

t = Traits[:FU00]
pp t.class    ## Trait
pp t.name
pp t.type.name
pp t.code
pp t.kai

t = Traits['Fur'][0]
pp t.class    ## Trait
pp t.name
pp t.type.name
pp t.code
pp t.kai

t = Traits['Pattern'][0]
pp t.class    ## Trait
pp t.name
pp t.type.name
pp t.code
pp t.kai

t = Traits['PA00']
pp t.class    ## Trait
pp t.name
pp t.type.name
pp t.code
pp t.kai

t = Traits['Vigilante']
pp t.class    ## Trait
pp t.name
pp t.type.name
pp t.code
pp t.kai
