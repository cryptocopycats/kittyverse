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
t = Traits['FU']['00']
t = Traits['FU'][0]
t = Traits[:FU][0]
t = Traits[:FU00]
t = Traits['Fur'][0]
# ...
```

For trait types (e.g. fur, pattern, eye color, eye shape, base color, etc.)
use:

``` ruby
t =  Traits[ :body ]
p t.class    #=> TraitType
p t.name     #=> "Fur"
p t.code     #=> "FU"
p t.genes    #=> "0-3"

# -or-

t =  TraitType.find_by_key( :body )
t =  TraitType.find_by( key: 'body' )
```




## Real World Usage

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
