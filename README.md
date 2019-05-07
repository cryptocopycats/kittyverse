# Kittyverse


kittyverse library - helper classes for cattributes, trait types, traits, genes, genomes and more for cryptokitties and copycats

* home  :: [github.com/cryptocopycats/kittyverse](https://github.com/cryptocopycats/kittyverse)
* bugs  :: [github.com/cryptocopycats/kittyverse/issues](https://github.com/cryptocopycats/kittyverse/issues)
* gem   :: [rubygems.org/gems/kittyverse](https://rubygems.org/gems/kittyverse)
* rdoc  :: [rubydoc.info/gems/kittyverse](http://rubydoc.info/gems/kittyverse)


## Usage

### Traits

Use the `Traits` helper class to lookup trait types (e.g. fur, pattern, eye color, eye shape, base color, etc.) and traits (e.g. savannah, selkirk, chantilly, etc.):

``` ruby
t = Traits[ 'FU00' ]
p t.class      #=> Trait
p t.name       #=> "savannah"
p t.type.name  #=> "Fur"
p t.code       #=> "FU00"
p t.kai        #=> "1"

# -or-

t = Trait.find_by_code( 'FU00' )
t = Trait.find_by( code: 'FU00' )
t = Traits[ 'savannah' ]
t = Traits[ 'Savannah' ]
t = Trait.find_by_name( 'Savannah' )
t = Trait.find_by( name: 'Savannah' )
t = Traits[ :body ][ '1' ]
t = Traits[ :body ][ '00' ]
t = Traits[ :body ][ 0 ]
t = Traits[ 'FU' ][ '00' ]
t = Traits[ 'FU' ][0]
t = Traits[ :FU ][0]
t = Traits[ :FU00 ]
t = Traits[ 'Fur' ][0]
# ...
```

#### What about `totesbasic`?

Note, the `totesbasic` pattern cattribute has _three_ traits, that is, `totesbasic 1` with the code `PA14`
and `totesbasic 2` with `PA15` and `totesbasic 3` with `PA23`.
Use:

``` ruby
t = Traits[ 'PA14' ]
p t.class      #=> Trait
p t.name       #=> "totesbasic 1"
p t.type.name  #=> "Pattern"
p t.code       #=> "PA14"
p t.kai        #=> "f"

# -or-

t = Trait.find_by_code( 'PA14' )
t = Trait.find_by( code: 'PA14' )
t = Traits[ 'totesbasic 1' ]
t = Traits[ 'Totesbasic 1' ]
t = Trait.find_by_name( 'Totesbasic 1' )
t = Trait.find_by( name: 'Totesbasic 1' )
t = Traits[ :body ][ 'f' ]
t = Traits[ :body ][ '14' ]
t = Traits[ :body ][ 14 ]
# ...
``` 



For trait types (e.g. fur, pattern, eye color, eye shape, base color, etc.)
use:

``` ruby
tt =  Traits[ :body ]
p tt.class    #=> TraitType
p tt.name     #=> "Fur"
p tt.code     #=> "FU"
p tt.genes    #=> "0-3"

# -or-

tt = TraitType.find_by_key( :body )
tt = TraitType.find_by( key: 'body' )
tt = Traits[ 'Fur' ]
tt = TraitType.find_by_name( 'Fur' )
tt = TraitType.find_by( name: 'Fur' )
tt = Traits[ 'FU' ]
tt = Traits[ :FU ]
tt = TraitType.find_by_code( 'FU' )
tt = TraitType.find_by( code: 'FU' )
# ...
```


### Cattributes

Use the `Cattribute` helper class to lookup cattributes incl. purrstige cattributes with timed trait recipes / forumlas:

``` ruby
c = Cattribute[ 'savannah' ]
p c.class          #=> Cattribute
p c.name           #=> "savannah"
p c.type.name      #=> "Fur"
p c.traits.size    #=> 1
p c.traits         #=> ["savannah"]
# ...

c = Cattribute[ 'totesbasic' ]
p c.class          #=> Cattribute
p c.name           #=> "totesbasic"
p c.type.name      #=> "Pattern"
p c.traits.size    #=> 3
p c.traits         #=> ["totesbasic 1", "totesbasic 2", "totesbasic 3"]
p c.traits[0].code #=> "PA14"
p c.traits[1].code #=> "PA15"
p c.traits[2].code #=> "PA23"
# ...

c = Cattribute[ 'bionic' ]
p c.class          #=> Cattribute
p c.name           #=> "bionic"
p c.type.name      #=> "Purrstige"
p c.traits.size    #=> 0
p c.traits         #=> []
p c.recipe         #=> {time: {start: "2019-05-01", end: "2019-08-31"},
                   #    traits: ["ragdoll",
                   #              "WE05",
                   #              ["totesbasic 1", "totesbasic 2", "totesbasic 3"],
                   #              "PU30"]}

# ...
```




## Real World Usage

### Reference Pages / Cheat Sheets

Auto-generated CryptoKitties refrence pages / cheat sheets include:

- [**CryptoKitties Cattributes Rarity / Popularity Statistics**](CATTRIBUTES.md)
- [**CryptoKitties Updates - Fancy / Exclusive / Special Edition Cats - Timeline**](updates/FANCIES.md)
- [**CryptoKitties Updates - Purrstige Trait Recipes / Formulas - Timeline**](updates/PURRSTIGES.md)
- and others



### More

See the [copycats command line tool (and core library)](https://github.com/cryptocopycats/copycats) - crypto cats / kitties collectibles unchained - buy! sell! hodl! sire! - play for free - runs off the blockchain - no ether / gas required


## More Documentation / Articles / Samples

- [Programming Crypto Collectibles Step-by-Step Book / Guide](https://github.com/openblockchains/programming-cryptocollectibles) -
Let's start with CryptoKitties & Copycats. Inside Unique Bits & Bytes on the Blockchain...
- [Ruby Quiz - Challenge #8 - Base32 Alphabet](https://github.com/planetruby/quiz/tree/master/008) - Convert the Super "Sekretoooo" 256-Bit CryptoKitties Genome to Kai Notation - Annipurrsary!



## License

![](https://publicdomainworks.github.io/buttons/zero88x31.png)

The `kittyverse` scripts are dedicated to the public domain.
Use it as you please with no restrictions whatsoever.


## Questions? Comments?

Post them on the [cryptokitties reddit](https://www.reddit.com/r/cryptokitties). Thanks.
