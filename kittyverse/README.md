# Kittyverse


kittyverse - helper classes for cattributes, trait types, traits, genes, genomes and more for cryptokitties and copycats

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
p t.name       #=> "Savannah"
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
p t.name       #=> "Totesbasic 1"
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
p c.name           #=> "Savannah"
p c.type.name      #=> "Fur"
p c.traits.size    #=> 1
p c.traits         #=> ["Savannah"]
p c.traits[0].code #=> "FU00"
# ...

c = Cattribute[ 'totesbasic' ]
p c.class          #=> Cattribute
p c.name           #=> "Totesbasic"
p c.type.name      #=> "Pattern"
p c.traits.size    #=> 3
p c.traits         #=> ["Totesbasic 1", "Totesbasic 2", "Totesbasic 3"]
p c.traits[0].code #=> "PA14"
p c.traits[1].code #=> "PA15"
p c.traits[2].code #=> "PA23"
# ...

c = Cattribute[ 'bionic' ]
p c.class          #=> Cattribute
p c.name           #=> "Bionic"
p c.type.name      #=> "Purrstige"
p c.traits.size    #=> 0
p c.traits         #=> []
p c.recipe         #=> {time: {start: "2019-05-01", end: "2019-08-31"},
                   #    traits: ["Ragdoll",
                   #              "WE05",
                   #              ["Totesbasic 1", "Totesbasic 2", "Totesbasic 3"],
                   #              "PU30"]}

# ...
```

### Fancies

Use the `Fancy` helper class to lookup fancy or exclusive or special edition cats  incl. timed trait recipes / forumlas, counts, limits, ids and more:

``` ruby
f = Fancy[ :genesis ]
p f.class         #=> Fancy
p f.name          #=> "Genesis"
p f.key           #=> :genesis
p f.exlusive?     #=> true
p f.ids.size      #=> 1
p f.ids           #=> [1]
#...

# -or-

f = Fancy.find_by_key( :genesis )
f = Fancy.find_by( key: 'genesis' )
f = Fancy[ 'Genesis' ]
f = Fancy.find_by_name( 'Genesis' )
f = Fancy.find_by( name: 'Genesis' )
# ...

f = Fancy[ :bugcat ]
p f.class         #=> Fancy
p f.name          #=> "Bug Cat"
p f.key           #=> :bugcat
p f.exlusive?     #=> true
p f.ids.size      #=> 3
p f.ids           #=> [101,102,103]
#...

# -or-

f = Fancy[ 'Bug Cat' ]
f = Fancy[ 'BugCat' ]
f = Fancy[ 'bugcat' ]
f = Fancy.find_by_name( 'Bug Cat' )
f = Fancy.find_by( name: 'Bug Cat' )
# ...
```

**Fancy Cat Types**

``` ruby
p Fancy.size                      #=> 83
p Fancy.exclusives.size           #=> 22
p Fancy.special_editions.size     #=> 5
p Fancy.fancies.size              #=> 56
```

Loop over all fancies:

``` ruby
Fancy.each do |fancy|
  p fancy.name
end

# ...
```


### Genome

Use the `Genome` helper class to
decipher the genes and lookup traits, mewtation tiers / levels,
recessive / hidden genes and more.

Let's build a gene reader. Pass in the "magic" 256-bit integer number for kitty #1001
from the blockchain
and get all 48 genes deciphered in 12x4 slices / blocks:

``` ruby
# kitty 1001
genome = Genome.new( 512955438081049600613224346938352058409509756310147795204209859701881294 )

genome.kai
#=> "aaaa 7885 22f2 agff 1661 7755 e979 2441 6667 7664 a9aa cfff"

genome.codes
#=> "09-09-09-09 06-07-07-04 01-01-14-01 09-15-14-14 00-05-05-00 06-06-04-04
#    13-08-06-08 01-03-03-00 05-05-05-06 06-05-05-03 09-08-09-09 11-14-14-14"

genome.binary
#=> "01001-01001-01001-01001 00110-00111-00111-00100 00001-00001-01110-00001
#    01001-01111-01110-01110 00000-00101-00101-00000 00110-00110-00100-00100
#    01101-01000-00110-01000 00001-00011-00011-00000 00101-00101-00101-00110
#    00110-00101-00101-00011 01001-01000-01001-01001 01011-01110-01110-01110"

genome.each_with_index do |slice,i|
     offset = i*4
     puts "#{slice.type.name} (#{slice.type.code}) - Genes #{slice.type.genes}:"
     puts "#{'%2d' % (0+offset)} | #{slice.d.name || '∅'} (#{slice.d.code})"
     puts "#{'%2d' % (1+offset)} | #{slice.r1.name || '∅'} (#{slice.r1.code})"
     puts "#{'%2d' % (2+offset)} | #{slice.r2.name || '∅'} (#{slice.r2.code})"
     puts "#{'%2d' % (3+offset)} | #{slice.r3.name || '∅'} (#{slice.r3.code})"
     puts
  end
```


resulting in:

```
Fur (FU) - Genes 0-3:
 0 | Ragamuffin (FU14)
 1 | Ragamuffin (FU14)
 2 | Ragamuffin (FU14)
 3 | Himalayan (FU11)

Pattern (PA) - Genes 4-7:
 4 | Luckystripe (PA09)
 5 | Luckystripe (PA09)
 6 | Calicool (PA08)
 7 | Luckystripe (PA09)

Eye Color (EC) - Genes 8-11:
 8 | Mintgreen (EC03)
 9 | Sizzurp (EC05)
10 | Sizzurp (EC05)
11 | Chestnut (EC06)

Eye Shape (ES) - Genes 12-15:
12 | Crazy (ES06)
13 | Simple (ES05)
14 | Simple (ES05)
15 | Simple (ES05)

Base Color (BC) - Genes 16-19:
16 | Shadowgrey (BC00)
17 | Orangesoda (BC03)
18 | Orangesoda (BC03)
19 | Salmon (BC01)

Highlight Color (HC) - Genes 20-23:
20 | Swampgreen (HC08)
21 | Royalpurple (HC06)
22 | Swampgreen (HC08)
23 | Lemonade (HC13)

Accent Color (AC) - Genes 24-27:
24 | Granitegrey (AC04)
25 | Granitegrey (AC04)
26 | Kittencream (AC06)
27 | Kittencream (AC06)

Wild Element (WE) - Genes 28-31:
28 | ∅ (WE00)
29 | ∅ (WE05)
30 | ∅ (WE05)
31 | ∅ (WE00)

Mouth (MO) - Genes 32-35:
32 | Happygokitty (MO14)
33 | Happygokitty (MO14)
34 | Soserious (MO15)
35 | Pouty (MO09)

Environment (EN) - Genes 36-39:
36 | ∅ (EN01)
37 | ∅ (EN14)
38 | ∅ (EN01)
39 | ∅ (EN01)

Secret Y Gene (SE) - Genes 40-43:
40 | ∅ (SE04)
41 | ∅ (SE07)
42 | ∅ (SE07)
43 | ∅ (SE06)

Purrstige (PU) - Genes 44-47:
44 | ∅ (PU09)
45 | ∅ (PU09)
46 | ∅ (PU09)
47 | ∅ (PU09)
```


Tip: See the chapter 2 in the
"[Programming Crypto Collectibles Step-by-Step Book / Guide. Let's start with CryptoKitties & Copycats. Inside Unique Bits & Bytes on the Blockchain...](https://github.com/cryptocopycats/programming-crypto-collectibles/blob/master/02_genereader.md)"
for how to create your own gene reader from scratch.


More ways to slice and dice the genome / genes:

``` ruby
genome[0].class          #=> Trait
genome[0].name           #=> "Ragamuffin"
genome[0].code           #=> "FU14"

genome[5].class          #=> Trait
genome[5].name           #=> "Luckystripe"
genome[5].code           #=> "PA09"

genome[40].class         #=> Trait
genome[40].name          #=> nil
genome[40].code          #=> "SE04"

genome.body.class        #=> Gene::Slice
genome.body.type.name    #=> "Fur"
genome.body.type.code    #=> "FU"
# -or-
genome[:body].class      #=> Gene::Slice
genome[:body].type.name  #=> "Fur"
genome[:body].type.code  #=> "FU"
# -or-
genome.fu.class          #=> Gene::Slice
genome.fu.type.name      #=> "Fur"
genome.fu.type.code      #=> "FU"
# -or-
genome[:FU].class        #=> Gene::Slice
genome[:FU].type.name    #=> "Fur"
genome[:FU].type.code    #=> "FU"

genome.body.d.class      #=> Trait
genome.body.d.name       #=> "Ragamuffin"
genome.body.d.code       #=> "FU14"
# -or-
genome[:body].d.class    #=> Trait
genome[:body].d.name     #=> "Ragamuffin"
genome[:body].d.code     #=> "FU14"
# -or-
genome.body[0].class     #=> Trait
genome.body[0].name      #=> "Ragamuffin"
genome.body[0].code      #=> "FU14"
# -or-
genome[:body][0].class   #=> Trait
genome[:body][0].name    #=> "Ragamuffin"
genome[:body][0].code    #=> "FU14"
# -or-
genome.fu.d.class        #=> Trait
genome.fu.d.name         #=> "Ragamuffin"
genome.fu.d.code         #=> "FU14"
# -or-
genome.fu[0].class       #=> Trait
genome.fu[0].name        #=> "Ragamuffin"
genome.fu[0].code        #=> "FU14"

genome.fu.r1.class       #=> Trait
genome.fu.r1.name        #=> "Ragamuffin"
genome.fu.r1.code        #=> "FU14"
# -or-
genome.body[1].class     #=> Trait
genome.body[1].name      #=> "Ragamuffin"
genome.body[1].code      #=> "FU14"
```

and so on and so forth.



## Real World Usage


See the [copycats command line tool (and core library)](https://github.com/cryptocopycats/copycats) - crypto cats / kitties collectibles unchained - buy! sell! hodl! sire! - play for free - runs off the blockchain - no ether / gas required


## More Documentation / Articles / Samples

- [Programming Crypto Collectibles Step-by-Step Book / Guide](https://github.com/cryptocopycats/programming-crypto-collectibles) -
Let's start with CryptoKitties & Copycats. Inside Unique Bits & Bytes on the Blockchain...
- [Ruby Quiz - Challenge #8 - Base32 Alphabet](https://github.com/planetruby/quiz/tree/master/008) - Convert the Super "Sekretoooo" 256-Bit CryptoKitties Genome to Kai Notation - Annipurrsary!




## License

![](https://publicdomainworks.github.io/buttons/zero88x31.png)

The `kittyverse` scripts are dedicated to the public domain.
Use it as you please with no restrictions whatsoever.


## Questions? Comments?

Post them on the [cryptokitties reddit](https://www.reddit.com/r/cryptokitties). Thanks.
