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


RECIPES = {
  
pepito: { name: 'Pepito',
          recipe: {
             time: { start: '2020-01-01', end: '2020-01-07' }, count: 443,
             traits: ['ragdoll', 'simple', 'meowgarine', 'junglebook'] },
        },


chitten: { name: 'Chitten',   ## todo/check: was time-limited?
          recipe: {
             time: { start: '2019-12-21', end: '?' }, count: 829,
             traits: ['burmilla', 'calicool', 'hotcocoa', 'tongue'] },
        },

puuurrot: { name: 'Puuurrot',   ## todo/check: was time-limited?
          recipe: {
             time: { start: '2019-12-07', end: '?' }, count: 650,
             traits: ['chantilly', 'firstblush', 'skyblue', 'tinybox'] },
        },

shoopadoop: { name: 'Shoopadoop',   ## todo/check: was time-limited?
          recipe: {
             time: { start: '2019-11-23', end: '?' }, count: 1269,
             traits: ['martian', 'wyrm', 'SE03'] },
        },

bartholomeow: { name: 'Bartholomeow', date: '2019-11-12',  # Page's Warriors series
                recipe: {
                  limit: 10_000, count: 1269,
                  traits: ['burmilla', 'thunderstruck', 'salmon', 'flamingo', 'rosequartz', 'wasntme'] },
              },   ## add shiny-enabled?  see https://www.cryptokitties.co/blog/post/ooooooh-shiny

gwendolion: { name: 'Gwendolion', date: '2019-11-10',   # Page's Warriors series - starter fancy
                recipe: {
                  limit: 50_000, count: 297,
                  traits: ['burmilla', 'salmon', 'icy'] },
            },

catseye: { name: 'Catseye', date: '2019-11-09',
                recipe: {
                  limit: 30_000, count: 196,
                  traits: ['burmilla', 'rascal', 'salmon', 'flamingo'] },
         },

# Oct 26, 2019 - Skeletonne Fancy Cat is discovered
skeletonne: { name: 'Skeletonne',   ## todo/check: was time-limited?
          recipe: {
             time: { start: '2019-10-26', end: '?' }, count: 752,
             traits: ['sphynx', 'scorpius', 'dreamboat', 'satiated'] },
        },

# Oct 12, 2019 - Furmione Fancy Cat is discovered
furmione: { name: 'Furmione',   ## todo/check: was time-limited?
          recipe: {
             time: { start: '2019-10-12', end: '?' }, count: 832,
             traits: ['spangled', 'firstblush', ['poisonberry', 'mallowflower']] },
        },

# Sep 20, 2019 - Purrzival Fancy Cat is discovered
purrzival: { name: 'Purrzival the Paladin',  date: '2019-09-20',  ## todo/check: was time-limited too?
          recipe: {
             limit: 30_000, count: 316,
             traits: ['thunderstruck', 'rosequartz', 'peach', 'wasntme'] },
        },

# Sep 28, 2019 - Jack Fancy Cat is discovered
jack: { name: 'Jack',   ## todo/check: was time-limited?
          recipe: {
             time: { start: '2019-09-28', end: '?' }, count: 721,
             traits: ['savannah', 'shadowgrey', 'granitegrey', 'jacked'] },
        },

# Sep 14, 2019 - Pawderick the Lancer Fancy Cat is discovered
pawderick: { name: 'Pawderick the Lancer',  date: '2019-09-14',  ## todo/check: was time-limited too?
          recipe: {
             limit: 50_000, count: 665,
             traits: ['ganado', 'rosequartz', 'wasntme'] },
        },

# Aug 31, 2019 - Robin Fancy Cat is discovered
robin: { name: 'Robin',   ## todo/check: was time-limited?
          recipe: {
             time: { start: '2019-08-31', end: '?' }, count: 1837,
             traits: ['stunned', 'meowgarine', 'kittencream', 'fetherbrain'] },
        },

# Aug 17, 2019 - Kitty Formerly Known as Prince Fancy Cat is discovered
kittyformerlyknownasprince: { name: 'Kitty Formerly Known As Prince',   ## todo/check: was time-limited?
          recipe: {
             time: { start: '2019-08-17', end: '?' }, count: 503,
             traits: ['leopard', 'tendertears', 'royalblue', 'pouty'] },
        },
 
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
