# Kittyverse GraphQL  (incl. CryptoKitties Sales GraphQL)


kittyverse-graphql - web client (helpers) for using CryptoKitties (HTTP JSON) GraphQL APIs



* home  :: [github.com/cryptocopycats/kittyverse](https://github.com/cryptocopycats/kittyverse)
* bugs  :: [github.com/cryptocopycats/kittyverse/issues](https://github.com/cryptocopycats/kittyverse/issues)
* gem   :: [rubygems.org/gems/kittyverse-graphql](https://rubygems.org/gems/kittyverse-graphql)
* rdoc  :: [rubydoc.info/gems/kittyverse-graphql](http://rubydoc.info/gems/kittyverse-graphql)




## Usage

A lite web client wrapper for the CryptoKitties Sales open graph api
powered by the Graph.
See [**thegraph.com/explorer/subgraph/nieldlr/cryptokitties-sales »**](https://thegraph.com/explorer/subgraph/nieldlr/cryptokitties-sales).



Example - Get the latest kitties sold in auctions:

``` ruby
require 'kittyverse/graphql'

c = Kittyverse::GraphQL::Client.new

data = c.query( <<GRAPHQL )
{
  auctions(first: 10,
           orderBy: endedAt,
           orderDirection: desc,
           where: {state: "sold"})
  {
    state
    soldPrice
    startedAt
    endedAt
    winner
    cryptoKitty {
      id
    }
  }
}
GRAPHQL
```


resulting in:

``` ruby
{"data"=>
  {"auctions"=>
    [{"cryptoKitty"=>{"id"=>"411361"},
      "endedAt"=>"1617784066",
      "soldPrice"=>"5000000000000000",
      "startedAt"=>"1559543782",
      "state"=>"sold",
      "winner"=>"0x201e269455d823b558ba11a2873779a7ea44b599"},
     {"cryptoKitty"=>{"id"=>"537620"},
      "endedAt"=>"1617783764",
      "soldPrice"=>"6000000000000000",
      "startedAt"=>"1519347485",
      "state"=>"sold",
      "winner"=>"0x776d795de3b4726422fea94f0529a570e05998c2"},
     #...
    ]
  }
}
```

Let's pretty print the auction data:

``` ruby
def wei_to_eth( wei )
  wei_per_eth = 1_000_000_000_000_000_000   ## wei (10^18)
  Float(wei) / Float(wei_per_eth)
end

def print_sales( recs )
  puts "  price (in eth), price (in wei),  date,  kitty id,  winner\n"
  recs.each do |rec|
      print '%f eth  ' % wei_to_eth( rec['soldPrice'].to_i )
      print '(%d wei)  ' % rec['soldPrice'].to_i
      print  Time.at( rec['endedAt'].to_i ).utc
      print "   "
      print "##{rec['cryptoKitty']['id']}  "
      print rec['winner']
      print "\n"
  end
end

print_sales( data['data']['auctions'] )
```

resulting in:

```
price (in eth), price (in wei),        date,                 kitty id,  winner
0.005000 eth  (5000000000000000 wei)   2021-04-07 08:27:46   #411361    0x201e2694...
0.006000 eth  (6000000000000000 wei)   2021-04-07 08:22:44   #537620    0x776d795d...
0.005000 eth  (5000000000000000 wei)   2021-04-07 07:42:39   #1641139   0x776d795d...
0.012539 eth  (12538972095383055 wei)  2021-04-07 07:19:45   #799099    0x48f3d916...
0.012580 eth  (12579516235413496 wei)  2021-04-07 07:17:52   #1302761   0x48f3d916...
0.005000 eth  (5000000000000000 wei)   2021-04-07 06:56:57   #405308    0x131b3957...
0.009900 eth  (9900000000000000 wei)   2021-04-07 03:55:36   #1244187   0xfdf8f7e6...
0.005000 eth  (5000000000000000 wei)   2021-04-07 03:55:25   #1470744   0xde0515ec...
0.005000 eth  (5000000000000000 wei)   2021-04-07 03:36:25   #1815178   0xde0515ec...
0.012586 eth  (12586110096397768 wei)  2021-04-07 03:08:55   #1348108   0x833b59ac...
```


Or let's query for the all-time high.
Example - Get the most expensive kitties sold in auctions:


``` ruby
data = c.query( <<GRAPHQL )
{
  auctions(first: 10,
           orderBy: soldPrice,
           orderDirection: desc,
           where: {state: "sold"})
  {
    state
    soldPrice
    endedAt
    winner
    cryptoKitty {
      id
    }
  }
}
GRAPHQL
```

resulting in:

``` ruby
{"data"=>
  {"auctions"=>
    [{"cryptoKitty"=>{"id"=>"896775"},
      "endedAt"=>"1536034886",
      "soldPrice"=>"600000000000000000000",
      "state"=>"sold",
      "winner"=>"0x0e7afeee3a623decb71cf367e86191865ede6c5f"},
     {"cryptoKitty"=>{"id"=>"18"},
      "endedAt"=>"1512617298",
      "soldPrice"=>"253336776620370370370",
      "state"=>"sold",
      "winner"=>"0xa6d3fdf423bbc578dd4d41220078475371626b22"},
     #...
     ]
  }
}
```

Let's pretty print the auction data (again):

``` ruby
print_sales( data['data']['auctions'] )
```

resulting in:

```
price (in eth), price (in wei),              date,                 kitty id,  winner
600.000000 eth  (600000000000000000000 wei)  2018-09-04 04:21:26   #896775    0x0e7afeee...
253.336777 eth  (253336776620370370370 wei)  2017-12-07 03:28:18   #18        0xa6d3fdf4...
247.000000 eth  (247000000000000000000 wei)  2017-12-06 19:41:57   #4         0x61a4575d...
246.925530 eth  (246925530478395061729 wei)  2017-12-02 20:32:36   #1         0x79bd5924...
237.522840 eth  (237522839506172839507 wei)  2017-12-08 09:31:03   #21        0x58323a0b...
225.000000 eth  (225000000000000000000 wei)  2017-12-08 09:34:36   #22        0x58323a0b...
222.000000 eth  (222000000000000000000 wei)  2017-12-05 16:45:01   #5         0x69c94767...
190.046825 eth  (190046825396825396825 wei)  2017-12-04 19:45:47   #7         0x2ff1e192...
188.889654 eth  (188889654097222222223 wei)  2017-12-06 07:18:02   #35        0x7ca91be7...
179.073438 eth  (179073437500000000000 wei)  2017-12-06 18:11:42   #87        0xc3003be6...
```


Or let's query for the aggregated totals.
Example - Get the aggregated all-time auction totals:

``` ruby
data = c.query( <<GRAPHQL )
{
  aggregation(id: "1") {
    totalAuctions
    totalAuctionsSold
    totalAuctionsCancelled
    totalUniqueCryptoKittiesAuctioned
    totalUniqueCryptoKittiesSold
    totalEtherRevenue
  }
}
GRAPHQL
```

resulting in:

``` ruby
{"data"=>
  {"aggregation"=>
    {"totalAuctions"=>"1162357",
     "totalAuctionsCancelled"=>"251887",
     "totalAuctionsSold"=>"724983",
     "totalEtherRevenue"=>"63705844622899779521107",
     "totalUniqueCryptoKittiesAuctioned"=>"807028",
     "totalUniqueCryptoKittiesSold"=>"595308"}}}
```

And so on and so forth.




## New to CryptoKitties?

See the
[**Programming CryptoKitties & Copycats Step-by-Step Booklet / Guide »**](https://github.com/cryptocopycats/programming-cryptokitties)




## Install

Just install the gem:

    $ gem install kittyverse-graphql


## License

The scripts are dedicated to the public domain.
Use it as you please with no restrictions whatsoever.


## Questions? Comments?


Post them on the [CryptoKittiesDev reddit](https://old.reddit.com/r/CryptoKittiesDev). Thanks.
