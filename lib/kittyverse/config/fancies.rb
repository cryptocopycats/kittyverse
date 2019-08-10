# encoding: utf-8

###
#
#  for latest updates on new fancies/exclusives see:
#      https://updates.cryptokitties.co   (official latest updates/timeline)
#
#  or see
#      https://blog.kotobaza.co/timeline/
#
#  or see
#      https://kittyhelper.co/price-floor/exclusive/
#      https://kittyhelper.co/price-floor/specialedition/
#      https://kittyhelper.co/price-floor/fancy/




##
## note:
##  for time limits for fancies use:
##     e.g. time: { end: '2018-12-07' }   # until dec/7
##
##  for overflows for limited edition use:
##     e.g. overflow: 1      #   888+1  (=889)

SPECIAL_EDITIONS = {
  'kitt-e': { name: 'KITT-E', date: '2019-05-10',
              specialedition: {
                limit: 500 },
              desc: 'Dapper (Crypto Contract) Wallet Promotion Cat'
            },
  # Apr 10, 2019
  # Sparkles Special Edition Cat is released.Special Edition Cat
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
                   limit: 468 }
               },
}


EXCLUSIVES = {
  'dapp-e': { name: 'DAPP-E', date: '2019-05-10',
              exclusive: {
                limit: 50, ids: (1829..1878).to_a },
              desc: 'Dapper (Crypto Contract) Wallet Promotion Cat'
            },
  papacatuanuku: { name: 'Papacatuanuku', date: '2019-03-31',
                   exclusive: {
                     limit: 1, ids: [1500000] },
                   desc: 'Kitty #1500000'
                 },
  # Mar 26, 2019
  # Sir Meowsalot Exclusive Cat is released. Exclusive Cat
  sirmeowsalot: { name: 'Sir Meowsalot', date: '2019-03-26',
                  exclusive: {
                    limit: 21, ids: (201..221).to_a }
                },

  cyberberry: { name: 'Cyber Berry', date: '2019-03-02',
                exclusive: {
                  limit: 1, ids: [282] },
                desc: "Winner of the NFTme Sweetstakes"
              },

  # Mar 1, 2019
  # Hinecatone Exclusive Cat is discovered. Exclusive Cat
  hinecatone: { name: 'Hinecatone', date: '2019-03-01',
                exclusive: {
                  limit: 15, ids: [1423547, 1433380, 1433486, 1440835, 1453366, 1456935, 1456973, 1459319, 1463197, 1466118, 1474082, 1484593, 1484982, 1492154, 1498885]}
              },

  # Feb 15, 2019
  # Felono Exclusive Cat is discovered. Exclusive Cat
  felono: { name: 'Felono', date: '2019-02-15',
            exclusive: {
              limit: 30, ids: [1394641, 1404595, 1406021, 1413065, 1414375, 1420553, 1421315, 1421864, 1424104 ,1425433, 1431823, 1435517, 1436333, 1449860, 1451482, 1455458, 1459320, 1462952, 1463069, 1476999, 1483225, 1487210, 1487551, 1489681, 1490345, 1491632, 1492206, 1492739, 1492817, 1498778]}
          },
  hypurrion: { name: 'Hypurrion', date: '2019-01-10',
               exclusive: {
                 limit: 1, ids: [269]},
               desc: 'Hyperion - Mythic Titan of Light - Gods Unchained Promotion'
             },
  dracothemagnificent:  { name: 'Draco The Magnificent', date: '2018-11-27',
                          exclusive: {
                            limit: 12, ids:	(270..281).to_a }
                        },
  bugcatv2:             { name: 'Bug Cat V2', date: '2018-11-27',
                          exclusive: {
                            limit: 20, ids: (167..186).to_a },
                          desc: 'Bug Bounty II (Offers Contract) Kitty'
                        },
  lilbubthemagicalspacecat: { name: 'Lil Bub Ub Bub (BUB) The Magical Space Cat', date: '2018-11-13',
                              exclusive: {
                                limit: 3, ids: [266,267,268]}
                            },
  vulcat:   { name: 'Vulcat', date: '2018-09-12',
              exclusive: {
                limit: 1, ids: [1000000] },
              desc: '1 000 000th Kitty'
            },
  vulcant:        { name: 'Vulcant', date: '2018-08-31',
                    exclusive: {
                      limit: 20, ids: [932914,937360,938299,946526,948925,949058,950617,952280,952981,956374,956908,958570,964205,967234,983046,984451,990713,992861,995745,997469] }
                  },
  rabbidkitty:    { name: 'Rabbid Kitty', date: '2018-08-23',
                    exclusive: {
                       limit: 6, ids: (260..265).to_a },
                    desc: 'Ubisoft Blockchain Heroes Hackathon'
                  },
 honu:           { name: 'Honu', date: '2018-07-20',
                   exclusive: {
                     limit: 1, ids: [251] },
                   desc: 'Kitties for Good - Save Turtle Habitats'
                 },
 victoire:       { name: 'Victoire', date: '2018-07-18',
                   exclusive: {
                     limit: 1, ids: [402] },
                   desc: 'France Football World Cup Champion'
                 },
  furlin:        { name: 'Furlin', date: '2018-06-26',
                   exclusive: {
                     limit: 52, ids: (115..126).to_a + (128..166).to_a }
                 },
  celestialcyberdimension: { name: 'Celestial Cyber Dimension', date: '2018-05-12',
                             exclusive: {
                               limit: 1, ids: [127] }
                           },

=begin
 ## May 7, 2018
 ## old retired (failed) exclusive with Warriors' Steph Curry (NBA Superstar) Basketball Celebrity Promotion

'#30furry': { name: '#30 Furry', date: '2018-05-07',  ## todo/fix: url-escape name '#30furry' for picture
              exclusive: {
                limit: 1, ids: [330] },
              desc: 'Steph Curry (NBA Superstar) Basketball Celebrity Promotion Cat'
            },
 cheffurry: {  name: 'Chef Furry', date: '2018-05-07',
               exclusive: {
                 limit: 1, ids: [130] },
               desc: 'Steph Curry (NBA Superstar) Basketball Celebrity Promotion Cat'
             },
  stephfurthree: { name: 'Steph Fur Three',  date: '2018-05-07',
                   exclusive: {
                     limit: 1, ids: [230] },
                   desc: 'Steph Curry (NBA Superstar) Basketball Celebrity Promotion Cat'
                 },
=end


  goldendragoncat: { name: 'Golden Dragon Cat', name_cn: '帝龙喵', date: '2018-03-08',
                     exclusive: {
                       limit: 1, ids: [888] },
                     desc: 'China Launch'
                   }, ## todo: check date for china launch specials!!!
  goldendogcat:    { name: 'Golden Dog Cat', name_cn: '旺财汪', date: '2018-03-08',
                     exclusive: {
                       limit: 11, ids: [1802,1803,1805,1806,1808,1809,1812,1816]+(1825..1828).to_a },
                     desc: 'China Launch'
                   },  ## todo: check date for china launch specials!!!

  knightkitty:  { name: 'Knight Kitty',  date: '2018-03-01',
                  exclusive: {
                    limit: 11, ids: (104..114).to_a }
                },
  cathena:         { name: 'Cathena',  date: '2018-02-06',
                    exclusive: {
                      limit: 1, ids: [500000] },
                    desc: '500 000th Kitty'
                  },
  genesis:      { name: 'Genesis', date: '2017-11-24',
                  exclusive: {
                    limit: 1, ids: [1] },
                  desc: '1st Kitty'
                },
  bugcat:       { name: 'Bug Cat', date: '2017-11-23',
                  exclusive: {
                    limit: 3, ids: [101,102,103] },
                  desc: 'Bug Bounty Kitty' }
}


RECIPES = {
  # Aug 3, 2019 - DJ Meowlody Fancy Cat is discovered
  djmeowlody: { name: 'DJ Meowlody',
                recipe: {
                   time: { start: '2019-08-03', end: '2019-11-30' }, count: 155,
                   traits: ['happygokitty', 'ragdoll', 'tigerpunk', 'oceanid'] },
              },

  # Jul 22, 2019 - Poison Orchid Fancy Cat is discovered
  poisonorchid: { name: 'Poison Orchid', date: '2019-07-22',
                  recipe: {
                    limit: 499,
                    traits: ['burmilla', 'henna', 'drama', 'onyx', 'wolfgrey', 'dreamboat', 'SE29'] },
                  desc: 'Ninja Fancy Cat' },

  # Jul 18, 2019 - Catyrax Fancy Cat is discovered
  catyrax: { name: 'Catyrax', date: '2019-07-18',
             recipe: {
                limit: 500,
                traits: ['lykoi', 'henna', 'bornwithit', 'onyx', 'wolfgrey', 'fallspice', 'SE28'] },
             desc: 'Fish-Flinging Ninja Fancy Cat' },

  # Jul 6, 2019 - Catamari Fancy Cat is discovered
  catamari: { name: 'Catamari',
              recipe: {
                time: { start: '2019-07-06', end: '2019-07-19' }, count: 378,
                traits: ['moonrise', 'cobalt', 'ducky', 'salty'] },
              desc: 'Monster Fancy Cat' },

  # Jun 22, 2019 - Magmeow Fancy Cat is discovered
  magmeow: { name: 'Magmeow',
             recipe: {
               time: { start: '2019-06-23', end: '2019-06-26' }, count: 736,
               traits: ['liger', 'moonrise', 'redvelvet', 'dragontail' ] },
              desc: 'Multi-Limbed Magma Monster Fancy Cat' },

  # Jun 8, 2019 - Kitijira Fancy Cat is discovered
  kitijira: { name: 'Kitijira',
              recipe: {
                time: { start: '2019-06-08', end: '2019-06-21' }, count: 645,
                traits: ['mainecoon', 'moonrise', 'atlantis', 'universe', 'dragontail'] },
              desc: 'City-Smashing Lizard Monster Fancy Cat' },

  # May 25, 2019 - The Whisper Fancy Cat is discovered
  whisper:  { name: 'Whisper',
              recipe: {
                time: { start: '2019-05-25', end: '2019-05-31' }, count: 861,
                traits: ['onyx', 'henna', 'wolfgrey', 'sully', 'candyshoppe' ] },
              desc: 'Ninja Fancy Cat' },

  # May 11, 2019 - Curdlin Fancy Cat is discovered
  curdlin: { name: 'Curdlin',
                recipe: {
                  time: { start: '2019-05-11', end: '2019-11-30' }, count: 4,
                  traits: ['nachocheez', 'saycheese', 'missmuffett', 'dippedcone']},
                desc: 'Cheeze Wizard Cat - Celebrating the Launch of the Cheeze Wizards on the Blockchain'
                ## see https://www.cryptokitties.co/blog/post/things-are-getting-cheezy-in-cryptokitties
             },

  # Apr 27, 2019 - Krakitten Fancy Cat is discovered
  krakitten: { name: 'Krakitten',
               recipe: {
                 time: { start: '2019-04-27', end: '2019-05-06' }, count: 1221,
                 traits: ['cobalt', 'ducky', 'salty', 'splat']},
                 ## desc: 'Beware the Krakitten in the briny deep.'
             },
  # Apr 13, 2019 - Furbeard Fancy Cat is discovered
  furbeard: { name: 'Furbeard',
              recipe: {
                time: { start: '2019-04-13', end: '2019-04-26'}, count: 3733,
                traits: ['inflatablepool', 'hanauma', 'neckbeard']},
                desc: 'Dread Pirate Cat'   # Avast Ye! This Old Salt knows a few tricks: how to avoid a meowtiny, how to get out of swabbing the litter deck, and just where the captain's log is buried.
                ## see https://www.cryptokitties.co/blog/post/pirate-cats-are-plundering-cryptokitties/
            },

  # Mar 30, 2019
  # Glitter Fancy Cat is discovered. Fancy Cat
  glitter: { name: 'Glitter',
             recipe: {
               time: { start: '2019-03-30', end: '2019-11-30'},  count: 658,   ## note: ++count NOT FINAL!!!
               traits: ['rorschach', 'juju', 'unicorn', 'hyacinth'] }
           },

  # Mar 16, 2019
  # Clover Fancy Cat is discovered. Fancy Cat
  clover: { name: 'Clover', date: '2019-03-16',
            recipe: {
              limit: 2506,
              traits: ['shamrock', 'emeraldgreen', 'roadtogold', 'PU27'] },
            desc: "Celebrating St. Patrick's Day 2019 (March/19th)"
          },

  # Mar 2, 2019
  # Glasswalker Fancy Cat is discovered. Fancy Cat
  glasswalker: { name: 'Glasswalker', date: '2019-03-02',
                 recipe: {
                   limit: 1230,
                   traits: ['cloudwhite', 'henna', 'pearl', 'firedup'] },
                 desc: "Ninja Fancy Cat"
                },

  # Feb 21, 2019
  # Ande Fancy Cat is discovered. Fancy Cat
  ande: { name: 'Ande', date: '2019-02-21',
          recipe: {
            limit: 440,
            traits: ['munchkin', 'cashewmilk', 'moue', 'PU30', 'WE10'] }
        },
  # Feb 17, 2019
  # Al Fancy Cat is discovered. Fancy Cat
  al: { name: 'Al',
        recipe: {
          time: { start: '2019-02-17', end: '2019-12-01'}, count: 3209, ## note: count NOT FINAL!!!
          traits: ['munchkin','moue','cashewmilk','brownies'] }
      },
  # Feb 16, 2019
  # Pizzazz Fancy Cat is discovered.Fancy Cat
  pizzazz: { name: 'Pizzazz',
             recipe: {
               time: { start: '2019-02-16', end: '2019-12-01'}, count: 1438, ## note: count NOT FINAL!!!
               traits: ['mekong', 'scarlet', 'spangled', 'wonky'] }
           },

  # Feb 9, 2019
  # Miss Purrfect Fancy Cat is discovered.Fancy Cat
  misspurrfect: { name: 'Miss Purrfect',
                  recipe: {
                    time: { start: '2019-02-09', end: '2019-02-14'}, count: 1298,
                    traits: ['allyouneed', 'butterscotch', 'asif', 'satiated', 'flapflap']},
                  desc: "Celebrating St. Valentine's Day 2019 (Feb/14th)"
                  ## see https://www.cryptokitties.co/blog/post/how-to-breed-miss-purrfect/
                },

  ## 2019
  ## January

  # Jan 26, 2019
  # Squib Fancy Cat is discovered. Fancy Cat
  squib: { name: 'Squib', date: '2019-01-26',
           recipe: {
             limit: 1443,    ## todo/check:  check if time-windows?
             traits: ['oldlace', 'razzledazzle', 'buzzed', 'rollercoaster']},
           desc: 'Celebrating American Football Super Bowl LIII in 2019'
           ## see https://www.cryptokitties.co/blog/post/how-to-breed-squib/
         },

  tallythepurrocious: { name: 'Tally The Purrocious',
                        recipe: {
                          time: { start: '2019-01-10', end: '2019-01-21' }, count: 3992,
                          traits: ['selkirk', 'koala', 'arcreactor', 'sully'] },
                        desc: 'Gods Unchained Promotion - Mystical Cat Talisman'
                      },

  genedough: { name: 'Gene Dough',
               recipe: {
                 time: { start: '2018-12-23', end: '2019-01-07' }, count: 1376,
                 traits: ['hotcocoa', 'mittens', 'frosting'] }
            },
  pawrula:  { name: 'Pawrula the Bright',
              recipe: {
                 time: { start: '2018-12-15', end: '2019-11-30' }, count: 1952,  ## note: count NOT FINAL!!!
                 traits: ['camo', 'butterscotch', 'fox'] },
              desc: 'Neha Narula - Director of the Digital Currency Initiative at the MIT Media Lab'
            },

  ## November
  draco:                { name: 'Draco',
                          recipe: {
                            time: { start: '2018-11-30', end: '2018-12-07' }, count: 1115,
                            traits: ['toyger', 'martian', 'peppermint', 'dragonwings', 'SE03'] }
                        },
  dracojunior: { name: 'Draco Junior',
                 recipe: {
                   time: { start: '2018-11-26', end: '2018-12-07' }, count: 1398,
                   traits: ['lynx', 'verdigris', 'dragontail', 'SE03']}
               },
  dreggo:      { name: 'Dreggo',
                 recipe: {
                   time: { start: '2018-11-21', end: '2018-12-07' }, count: 3624,
                   traits: ['siberian', 'bananacream', 'SE03'] }
               },
  pickles:     { name: 'Pickles', date: '2018-11-14',
                 recipe: {
                   limit: 303,
                   traits: ['lynx', 'martian', 'highsociety', 'emeraldgreen']}
               },
  ## October
  dukecat:       { name: 'Dukecat', date: '2018-10-18',
                   recipe: {
                     limit: 1366,
                     traits: ['cymric', 'periwinkle', 'simple', 'tongue']}
                 },
  sheilapurren:  { name: 'Sheila Purren', date: '2018-10-04',
                   recipe: {
                     limit: 1971,
                     traits: ['mauveover', 'icy', 'wingtips', 'fangtastic']},
                   desc: 'Sheila Warren Kitty-fied - Head of Blockchain and Distributed Ledger Technology at the World Economic Forum (WEF)'
                 },

  ## September
  pawzilla: { name: 'Pawzilla', date: '2018-09-22',
              recipe: {
                limit: 1185,
                traits: ['jaguar', 'universe', 'atlantis', 'littlefoot']}
            },
  meowstro: { name: 'Meowstro', date: '2018-09-09',
              recipe: {
                limit: 1698,
                traits: ['onyx', 'wowza', 'eclipse']}
            },
  atlas:    { name: 'Atlas', date: '2018-09-07',
              recipe: {
                limit: 998,
                traits: ['highlander', 'kittencream', 'swarley', 'topoftheworld']}
            },

  ## August
  purrity:        { name: 'Purrity', date: '2018-08-23',
                    recipe: {
                      limit: 5984,
                      traits: ['selkirk', 'chronic', 'cloudwhite', 'cheeky'] }
                  },
  squiddlesworth: { name: 'Squiddlesworth', date: '2018-08-16',
                    recipe: {
                      limit: 1510,
                      traits: ['sphynx', 'redvelvet', 'patrickstarfish', 'dragontail'] },
                    desc: 'Lava Squid Cat'
                   },

  ## July
  purrspero:      { name: 'Purrspero', date: '2018-07-27',
                    recipe: {
                      limit: 4448,
                      traits: ['dippedcone', 'googly', 'royalpurple', 'beard']}
                  },
  catbury:        { name: 'Catbury', date: '2018-07-25',
                    recipe: {
                      limit: 76,
                      traits: ['ragdoll', 'crazy', 'chocolate', 'mintmacaron', 'yokel', 'WE02']}
                  },
  lulu:           { name: 'Lulu', date: '2018-07-13',
                    recipe: {
                      limit: 999,
                      traits: ['cyan', 'verdigris', 'turtleback', 'salty']}
                  },
  boot:           { name: 'Boot', date: '2018-07-05',
                    recipe: {
                      limit: 1440,
                      traits: ['ganado', 'wiley', 'cerulian', 'rollercoaster'],
                      variants: {
                        belgium: { name: 'Belgium', count: 97,   traits: [['orangesoda','onyx']]},                    ## Base Color: Orangesoda / Onyx
                        brazil:  { name: 'Brazil',  count: 195,  traits: [['hintomint','bananacream','verdigris']]},  ## Base Color: Hintomint / Bananacream / Verdigris
                        croatia: { name: 'Croatia', count: 253,  traits: [['cottoncandy','mauveover','oldlace']]},    ## Base Color: Cottoncandy / Mauveover / Oldlace
                        england: { name: 'England', count: 168,  traits: [['greymatter','martian']]},                 ## Base Color: Greymatter / Martian
                        france:  { name: 'France',  count: 317,  traits: [['harbourfog','cinderella','lavender']]},   ## Base Color: Harbourfog / Cinderella / Lavender
                        russia:  { name: 'Russia',  count: 94,   traits: [['shadowgrey','salmon','cloudwhite']]},     ## Base Color: Shadowgrey / Salmon/ Cloudwhite
                        sweden:  { name: 'Sweden',  count: 123,  traits: [['brownies','dragonfruit','redvelvet']]},   ## Base Color: Brownies / Dragonfruit / Redvelvet
                        uruguay: { name: 'Uruguay', count: 193,  traits: [['aquamarine','nachocheez','koala']]},      ## Base Color: Aquamarine / Nachocheez / Koala
                      }},
                    desc: 'Football World Cup',
                  },
  ## note: boot - different variants for world cup teams
  ##  Although there are 8 unique Fancies, they're actually each a variant on the same Fancy - Boot.
  ##  Their colours are different, and you can collect all 8 as a set

  ## June
  raspoutine:    { name: 'Raspoutine', date: '2018-06-28',
                   recipe: {
                     limit: 1867,
                     traits: ['buzzed', 'nachocheez', 'sandalwood', 'belch']}
                },
  kittypride:    { name: 'Kitty Pride', date: '2018-06-21',
                   recipe: {
                     limit: 1316,
                     traits: ['fabulous','cinderella','garnet']}
                 },
  furrmingo:     { name: 'Furrmingo', date: '2018-06-14',
                   recipe: {
                     limit: 333,
                     traits: ['bobtail', 'egyptiankohl', 'flamingo', 'whixtensions']}
                },

  ## May
  page:              { name: 'Page', date: '2018-05-31',
                       recipe: {
                         limit: 50_000,   count: 3936,  ## note: count NOT FINAL!!!
                         traits: ['rascal', 'peach', 'wasntme' ]}
                     },
  "schrödingerscat": { name: "Schrödinger's Cat", date: '2018-05-20',
                       recipe: {
                         limit: 73,
                         traits: ['forgetmenot','tinybox','PU20','SE25']}
                     },
  chatplongeur:      { name: 'Chat Plongeur', date: '2018-05-19',
                       recipe: {
                         limit: 1910,
                         traits: ['aquamarine', 'skyblue', 'seafoam'] }
                     },
  docpurr:             { name: 'Doc Purr', date: '2018-05-16',
                         recipe: {
                           limit: 250,
                           traits: ['persian','spock','raisedbrow','violet','tongue'] }
                       },
  swish:               { name: 'Swish', date: '2018-05-08',
                         recipe: {
                           limit: 2880,
                           traits: ['norwegianforest', 'luckystripe', 'thicccbrowz', 'orangesoda'] }
                       },

  ## April
  flutterbee:  { name: 'Flutterbee', date: '2018-04-28',
                 recipe: {
                   limit: 275,
                   traits: ['cloudwhite','jaguar','lemonade','azaleablush','WE14'] }
               },
  vernon:      { name: 'Vernon', date: '2018-04-16',
                 recipe: {
                   limit: 320,
                   traits: ['amur','fabulous','cottoncandy','springcrocus','belleblue','soserious']},
                 desc: 'Spring Equinox Kitty'  ## first, see https://www.cryptokitties.co/kitty/696398
                },

  ## March
  berry:           { name: 'Berry', date: '2018-03-16',
                     recipe: {
                       limit: 200,
                       traits: ['dragonfruit','thunderstruck','emeraldgreen','apricot','simple'] }
                   },
  pussforprogress: { name: 'Puss For Progress', date: '2018-03-08',
                     recipe: {
                       limit: 1920,
                       traits: ['himalayan','peach','safetyvest','gerbil'] },
                     desc: "Women's Day"
                   },
  fortunecat:      { name: 'Fortune Cat', name_cn: '红包喵', date: '2018-03-08',
                     recipe: {
                       limit: 888,
                       traits: ['harbourfog','calicool','swampgreen','sapphire','beard']}
                    },  ## todo: check date for china launch specials!!!
  liondance:    { name: 'Lion Dance', name_cn: '咚咚锵', date: '2018-03-07',
                  recipe: {
                    limit: 888, overflow: 1,  ## use count 889 ?? - why? why not?
                    traits: ['manx','royalblue','googly','starstruck']}
                },
  dogcat:       { name: 'Dog Cat',    name_cn: '汪星爷', date: '2018-03-02',
                  recipe: {
                    limit: 88,
                    traits: ['tigerpunk','periwinkle','barkbrown','sweetmeloncakes','yokel']},
                  desc: 'Year of the Dog (Greater China)'
                },

  ## February
  tabby:           { name: 'Tabby', date: '2018-02-26',
                     recipe: {
                       limit: 250,
                       traits: ['ragamuffin','morningglory','otaku','cheeky'] }
                   },
  yuricatsuki:     { name: 'Yuri Catsuki',  date: '2018-02-20',
                     recipe: {
                       limit: 250,
                       traits: ['cymric','tiger','neckbeard','elk'] },
                     desc: 'Figure Scating Kitty - Winter Olympics (Korea)'
                  },
  misterpurrfect:  { name: 'Mister Purrfect', date: '2018-02-14',
                     recipe: {
                       limit: 1000,
                       traits: ['chocolate','baddate','strawberry','wuvme'] },
                     desc: "Valentine's Day"
                   },
  earnie:          { name: 'Earnie', date: '2018-02-13',
                     recipe: {
                       limit: 500,
                       traits: ['birman','orangesoda','hotrod','grim'] },
                     desc: 'Earn.com - Golden Kitty Award (Product Hunt)'
                   },

  ## January
  'momo-chan':     { name: 'Momo-chan', date: '2018-01-31',
                     recipe: {
                       limit: 500,
                       traits: ['onyx','henna','bloodred','wolfgrey','sass'] },
                      desc: 'Ninja Kitty'
                   },
  negato:          { name: 'Negato', date: '2018-01-29',
                     recipe: {
                       limit: 500,
                       traits: ['onyx','henna','wolfgrey','slyboots'] },
                     desc: 'Ninja Kitty'
                   },
  stitches:        { name: 'Stitches', date: '2018-01-10',
                     recipe: {
                       limit: 500,
                       traits: ['hintomint','seafoam','swampgreen','saycheese'] },
                     desc: 'Zombie Kitty'
                   },

  ## 2017
  ## December
  phuziqaat:    { name: 'Phu Ziqaat', date: '2017-12-31',
                  recipe: {
                    limit: 1000,
                    traits: ['chartreux','spock','alien','pouty'] },
                  desc: 'Alien Kitty'
                },
  santaclaws:   { name: 'Santa Claws', date: '2017-12-12',
                  recipe: {
                    limit: 1000, overflow: 2,
                    traits: ['cloudwhite','scarlet','beard','WE12'] },
                  desc: 'Ho Ho Ho - Santa Claus Kitty'
                },
  mistletoe:    { name: 'Mistletoe', date: '2017-12-09',
                  recipe: {
                    limit: 2000,
                    traits: ['oldlace','crazy','gerbil'] },
                  desc: "XMas Kitty"
                },
  dracula:      { name: 'Dracula', date: '2017-12-01',
                  recipe: {
                    limit: 2000,
                    traits: ['laperm','spock','strawberry','WE01'] }
                },

  ## November
  ducat:        { name: 'Du Cat', date: '2017-11-29',
                  recipe: {
                    limit: 10_000,
                    traits: ['cymric','tongue']}
                },
  shipcat:      { name: 'Ship Cat', date: '2017-11-23',
                  recipe: {
                    limit: 2000,
                    traits: ['sphynx','orangesoda','luckystripe','crazy']}
                }
}


FANCIES = {}.merge( RECIPES )
            .merge( EXCLUSIVES )
            .merge( SPECIAL_EDITIONS )
