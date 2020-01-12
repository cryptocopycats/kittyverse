# encoding: utf-8


SPECIAL_EDITIONS = {
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
  ##
  ## date: '2019-01-10 ???  -- use for date "announced" or something - why? why not?
  aeoncat: { name: 'Aeoncat',
              specialedition: {
                time: { start: '2019-01-17', end: '2019-01-28' },
                limit: 380 },    ## Don't sleep - there's only 380 up for grabs!
              desc: 'Goddess Aeona - Goddess of Nature - Gods Unchained Promotion'
           },
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

