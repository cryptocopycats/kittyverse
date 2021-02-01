###
##  Special Editions - Crypto Kitties
##    see https://www.cryptokitties.co/catalogue/special-edition-cats
##
##  These cool Kitties have limited edition art
##   and are never obtainable through breeding


SPECIAL_EDITIONS = {

  frostymcwhiskers: { name: 'Frosty McWhiskers', date: '2020-12-14',
                      specialedition: {
                         limit: 104 },
                    },

  ###
  #  The redemption window to claim to your very own Fannie Special Edition Kitty
  #   will be closing this Saturday. For each Fannie, you'll need to submit
  #  a unique trio of Wild West Kitties (one Pickett, one Reeves and one Dart)
  #  to our Kitty Bounty Wallet  along with a valid submission form
  #  before the deadline on 12/5/2020 at 11:59pm PT
  fannie:   { name: 'Fannie', date: '2020-12-14',  ## first/lowest id:  #1_992_009
              specialedition: {
                 limit: 58 },
            },

  # With transactions getting stuck and costs to gift Kitties soaring through the roofs,
  # we've decided to extend the window to redeem your Katz band members
  # for Special Edition Mascots.
  # The new redemption window ends on September 1st, 11:59pm PT.
  ## Gas prices have slowed down redemption but there are currently
  ## 20 Algies and 30 Eddies earmarked for distribution.

  algie:    { name: 'Algie', date: '2020-10-29',  ## first/lowest id: #1_137_676 !!  - todo/check - first birthdate?
              specialedition: {
                 limit: 179 },
            },

  eddie:    { name: 'Eddie', date: '2020-09-03',  # first/lowest id: #1_967_278
              specialedition: {
                 limit: 110 },
            },

  marty:    { name: 'Marty', date: '2020-09-01',
              specialedition: {
                  limit: 188 },
              desc: 'Collaboration with Muse',
            },

  pandora: { name: 'Pandora', date: '2020-07-31',
             specialedition: {
               limit: 50 },
             desc: 'CryptoKitty Box Support',
          },

 holli:    { name: 'Holli', date: '2020-07-03',   # first/lowest id: #1_949_215
              specialedition: {
                 limit: 59 },
           },

 kikuyu:    { name: 'Kikuyu', date: '2020-06-13',
              specialedition: {
                  limit: 263 },
              desc: 'For Hunter+Zelig+Bodhi',
            },

 flowtron:   { name: 'Flowtron', date: '2020-05-21',
               specialedition: {
                  limit: 303 },
               desc: 'Exchange on Flow Fancy Set',
             },

 catterina:  { name: 'Catterina', date: '2020-05-13',
               specialedition: {
                   limit: 100 },
               desc: 'Momo Wang',
             },

 negabillie: { name: 'Nega Billie', date: '2020-04-27',
               specialedition: {
                  limit: 68 },
             },

 ##############
 # 2019
 carl:  { name: 'Carl', date: '2019-08-20',   # first/lowest id: #1_680_709
           specialedition: {
              limit: 40 },
        },

  alice: { name: 'Alice', date: '2019-08-23',  # first/lowest id: #1_681_913
           specialedition: {
             limit: 88 },
         },


  'kitt-e': { name: 'KITT-E', date: '2019-05-10',
              specialedition: {
                limit: 500 },
              desc: 'Dapper (Crypto Contract) Wallet Promotion Cat'
            },
  # Apr 10, 2019 - Sparkles Special Edition Cat is released.Special Edition Cat
  sparkles: { name: 'Sparkles', date: '2019-04-10',
              specialedition: {
                limit: 100 },
              desc: 'Freebie for CryptoKitties Community Events'
            },

  ## date: '2019-01-10 ???  -- use for date "announced" or something - why? why not?
  aeoncat: { name: 'Aeoncat',
              specialedition: {
                time: { start: '2019-01-17', end: '2019-01-28' },
                limit: 380 },    ## Don't sleep - there's only 380 up for grabs!
              desc: 'Goddess Aeona - Goddess of Nature - Gods Unchained Promotion'
           },

  #############################
  ## 2018
  ## December
  catzy: { name: 'Catzy', date: '2018-12-31',
           specialedition: {
             limit: 10, ids: (1137653..1137662).to_a },
           desc: 'Changpeng "CZ" Zhao - CEO of Binance - Top 10 Blockchain Influencer of the Year 2018 by CoinDesk'
         },
  purremyallaire: { name: 'Purremy Allaire', date: '2018-12-31',
                    specialedition: {
                      limit: 10, ids: (1137663..1137672).to_a },
                    desc: 'Jeremy Allaire - Top 10 Blockchain Influencer of the Year 2018 by CoinDesk'
                  },
  lilbub:      { name: 'Lil Bub Ub Bub (BUB)', date: '2018-11-13',
                 specialedition: {
                   limit: 500 }
               },
}

