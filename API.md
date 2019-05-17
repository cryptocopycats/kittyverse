# Using the CryptoKitties Unofficial (v0) and Official (v1) Public APIs

CryptoKitties offers two
public HTTP (Web Service) APIs returning
data in the structured JSON (JavaScript Object Notation) format.
The "original" and unofficial version 0 (v0) service
requires no sign-up or API token
but is now rate limited (20 requests/hour)
and the "eternal closed-beta" official version 1 (v1)
service requires a sign-up to the Kittyverse Purrgram
(see [`docs.api.cryptokitties.co`](https://docs.api.cryptokitties.co)) to get your API token
sent to your email inbox.




## The "Unofficial" Public API (v0) - No API Token Required

Let's start with the "classic" public HTTP (Web Service) JSON API.
Note: Because this API is "unofficial" you will NOT find
any official documentation on what services / endpoints you can call
and everything might change at anytime without notice.



### Getting the Statistics for All Cattributes (incl. Purrstiges)

Use [`GET /cattributes`](https://api.cryptokitties.co/cattributes)
to get a list of all cattributes (including purrstiges)
with trait types and running totals.

``` ruby
require "kittyverse"

c = Kitties::V0::Client.new
c.get_cattributes     ## same as get( '/cattributes' )
```

resulting in:

``` json
[{"description":"totesbasic","type":"pattern","gene":15,"total":"343048"},
 {"description":"thicccbrowz","type":"eyes","gene":7,"total":"253225"},
 {"description":"pouty","type":"mouth","gene":9,"total":"232226"},
 {"description":"granitegrey","type":"colortertiary","gene":4,"total":"228702"},
 {"description":"kittencream","type":"colortertiary","gene":6,"total":"225798"},
 ...
 {"description":"hooked","type":"prestige","gene":null,"total":"165"},
 {"description":"landlubber","type":"prestige","gene":null,"total":"144"},
 {"description":"timbers","type":"prestige","gene":null,"total":"108"}]  
```

Let's save the data in the JSON format pretty printed
into a file:

``` ruby
def save( name, data )
  File.open( "./dl/#{name}.json", 'w' ) do |f|
    f.write JSON.pretty_generate( data )
  end
end

data = c.get_cattributes     ## same as get( '/cattributes' )
save( "cattributes", data )
```

(Source: [`script/fetch.rb`](https://github.com/cryptocopycats/kittyverse/blob/master/script/fetch.rb))



### Getting the Kitten #1, #2, #3, ...


Use [`GET /kitties/<id>`](https://api.cryptokitties.co/kitties/1)
to get all the kitten's data by id.

``` ruby
c.get_kitty( 1 )     ## same as get( '/kitties/1' )
```

resulting in:

``` json
{ "id":1,
  "name":"Genesis",
  "generation":0,
  "created_at":"2017-11-23T06:19:59.000Z",
  "birthday":"2017-11-23T00:00:00.000Z",
  "image_url":"https://img.cryptokitties.co/0x06012c8cf97bead5deae237070f9587f8e7a266d/1.png",
  "image_url_cdn":"https://img.cn.cryptokitties.co/0x06012c8cf97bead5deae237070f9587f8e7a266d/1.png",
  "color":"sizzurp",
  "bio":"Greetings, human. I am Genesis...",
  "is_fancy":true,
  "is_exclusive":true,
  "is_special_edition":false,
  "fancy_type":"Genesis",
  "language":"en",
  "is_prestige":false,
  ...
}
```

Again let's save the data for kitten #1 and #2
in the JSON format pretty printed into files:

``` ruby
data = c.get_kitty( 1 )     ## same as get( '/kitties/1' )
save( "kitty1", data )

data = c.get_kitty( 2 )     ## same as get( '/kitties/2' )
save( "kitty2", data )
```





## The Official Public API, Version 1 (v1) - API Token Required - Apply Here

Note: The Official Public API requires a token.
Sign up for the Kittyverse program / purrgram
at [`docs.api.cryptokitties.co`](https://docs.api.cryptokitties.co)
to request an API token
and if all works out the CryptoKitties team will send you over
the API token via email to your inbox. Good luck.


Using the kittyverse library you can:

1) Add the token to your computing environment (ENV):

```
SET KITTIES_TOKEN=<your_token_here>
```

2) or configure the kittyverse library with a code block:

``` ruby
Kitties.configure do |config|
  config.token = "<your_token_here>"
end
```

3) or pass the token into the client:

``` ruby
c = Kitties::V1::Client.new( token: "<your_token_here>" )
```



### Getting the Statistics for all Cattributes (excl. Purrstiges)

Use `GET /cattributes`
to get a list of all cattributes
with trait types and running totals.
Note: The new official service call does NOT include the purrstiges traits.

``` ruby
c = Kitties::V1::Client.new
c.get_cattributes     ## same as get( '/cattributes' )
```

resulting in:

``` json
[{"description":"shadowgrey","type":"colorprimary","gene":0,"total":133927},
 {"description":"salmon","type":"colorprimary","gene":1,"total":90376},
 {"description":"greymatter","type":"colorprimary","gene":10,"total":196549},
 ...
]
```

Again let's save the data in the JSON format pretty printed
into a file:

``` ruby
data = c.get_cattributes     ## same as get( '/cattributes' )
save( "cattributes", data )
```


Tip: See the chapter 3 in the
"[Programming Crypto Collectibles Step-by-Step Book / Guide. Let's start with CryptoKitties & Copycats. Inside Unique Bits & Bytes on the Blockchain...](https://github.com/openblockchains/programming-cryptocollectibles/blob/master/03_cattributes.md)"
for how to create your own up-to-date
[Cattributes Rarity / Popularity Statistics Page / Cheatsheet](CATTRIBUTES.md) page, for example.



### Getting the Kitten #1, #2, ...

Use `GET /kitties/<id>`
to get all the kitten's data by id.

``` ruby
c.get_kitty( 1 )     ## same as get( '/kitties/1' )
```

resulting in:

``` json
{ "id":1,
  "name":"Genesis",
  "generation":0,
  "created_at":"2017-11-23T06:19:59.000Z",
  "image_url":"https://img.cryptokitties.co/0x06012c8cf97bead5deae237070f9587f8e7a266d/1.png",
  "image_url_cdn":"https://img.cn.cryptokitties.co/0x06012c8cf97bead5deae237070f9587f8e7a266d/1.png",
  "color":"sizzurp",
  "bio":"Greetings, human. I am Genesis...",
  "is_fancy":true,
  "is_exclusive":true,
  "fancy_type":"Genesis",
  "language":"en",
  "is_prestige":false,
  ...
}
```

<!--
check if v1 includes:
- birthday
- is_special_edition
- etc.
-->

Again let's save the data for kitten #1 and #2
in the JSON format pretty printed into files:

``` ruby
data = c.get_kitty( 1 )     ## same as get( '/kitties/1' )
save( "kitty1", data )

data = c.get_kitty( 2 )     ## same as get( '/kitties/2' )
save( "kitty2", data )
```


### Getting Colors for Body, Eyes, ...

Use `GET /colors/body|eyes|secondary|tertiary`,
to get a list of all hexadecimal r/g/b color codes
for the body (Base Color), eyes (Eye Color), secondary (Highlight Color),
tertiary (Accent Color) cattributes.


```ruby
data = c.get_colors_body       ## same as get( '/colors/body' )
save( "colors-body", data )
data = c.get_colors_eyes       ## same as get( '/colors/eyes' )
save( "colors-eyes", data )
data = c.get_colors_secondary  ## same as get( '/colors/secondary' )
save( "colors-secondary", data )
data = c.get_colors_tertiary   ## same as get( '/colors/tertiary' )
save( "colors-tertiary", data )
```

### Getting Everything Else

If there's no pre-made convenience wrapper in the kittyverse library (yet) for the
service, use the generic `get` method. Example:

``` ruby
data = c.get( '/cattributes/eyes/12' )
save( "cattributes-eyes-12", data )

data = c.get( '/kitties?gen=3-4' )
save( "kitties-gen_3-4", data)

# ...
```


That is for now.
Happy data wrangling and genome genetics bits & bytes slicing with ruby.



## Questions? Comments?

Post them on the [cryptokitties reddit](https://www.reddit.com/r/cryptokitties). Thanks.


