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



## Real World Usage

### Reference Pages / Cheat Sheets

Auto-generated CryptoKitties refrence pages / cheat sheets include:

- [**Cattributes Rarity / Popularity Statistics**](CATTRIBUTES.md)
- [**Updates - Fancy / Exclusive / Special Edition Cats - Timeline**](https://github.com/cryptocopycats/kittyverse/blob/master/updates/FANCIES.md)
- and others


### More

See the [copycats command line tool (and core library)](https://github.com/cryptocopycats/copycats) - crypto cats / kitties collectibles unchained - buy! sell! hodl! sire! - play for free - runs off the blockchain - no ether / gas required


## More Documentation / Articles / Samples

- [Programming Crypto Collectibles Step-by-Step Book / Guide](https://github.com/cryptocopycats/programming-cryptocollectibles) -
Let's start with CryptoKitties & Copycats. Inside Unique Bits & Bytes on the Blockchain...
- [Ruby Quiz - Challenge #8 - Base32 Alphabet](https://github.com/planetruby/quiz/tree/master/008) - Convert the Super "Sekretoooo" 256-Bit CryptoKitties Genome to Kai Notation - Annipurrsary!




## Questions? Comments?

Post them on the [cryptokitties reddit](https://www.reddit.com/r/cryptokitties). Thanks.


## License

![](https://publicdomainworks.github.io/buttons/zero88x31.png)

The `kittyverse` scripts are dedicated to the public domain.
Use it as you please with no restrictions whatsoever.
