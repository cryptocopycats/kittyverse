####
# use:
#  $ ruby -I ./lib sandbox/test_query.rb


require 'kittyverse/graphql'



c = Kittyverse::GraphQL::Client.new

query = <<GRAPHQL
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

data = c.query( query )
pp data

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


sleep(1)
puts "---"



query = <<GRAPHQL
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

data = c.query( query )
pp data

print_sales( data['data']['auctions'] )


sleep(1)
puts "---"



query = <<GRAPHQL
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

data = c.query( query )
pp data


puts "bye"

