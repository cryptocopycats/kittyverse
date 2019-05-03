# encoding: utf-8

###
#
#  for latest updates on new fancies/exclusives see:
#      https://updates.cryptokitties.co   (official latest updates/timeline)
#
#  or see
#      https://blog.kotobaza.co/timeline/


##
## todo/fix:
##    use count:   for time-limited fancies  do NOT use limit!!!  change limit to count!!!

##
## note:
##  for time limits for fancies use:
##     e.g. time: { end: '2018-12-07' }   # until dec/7
##
##  for overflows for limited edition use:
##     e.g. overflow: 1      #   888+1  (=889)


### todo/fix:
##    split into EXCLUSIVES  
##       and into SPECIAL_EDITIONS   (SPECIALS?)  - why? why not?



FANCIES =
{
  # Apr 27, 2019
  # Krakitten Fancy Cat is discovered. Fancy Cat
  krakitten: { name: 'Krakitten', date: '2019-04-27',
               time: { end: '2019-05-06' },
               traits: ['cobalt', 'ducky', 'salty', 'splat']
             },
  # Apr 13, 2019
  # Furbeard Fancy Cat is discovered. Fancy Cat
  furbeard: { name: 'Furbeard', date: '2019-04-13',
              limit: 3733,
              traits: ['inflatablepool', 'hanauma', 'neckbeard']
            },

  # Apr 10, 2019
  # Sparkles Special Edition Cat is released.Special Edition Cat
  sparkles: { name: 'Sparkles', date: '2019-04-10',
              limit: 100,
              special: true,
              desc: 'Freebie for CryptoKitties Community Events'
            },

  papacatuanuku: { name: 'Papacatuanuku', date: '2019-03-31', limit: 1, ids: [1500000],
                   exclusive: true,
                   desc: 'Kitty #1500000' },

  # Mar 30, 2019
  # Glitter Fancy Cat is discovered. Fancy Cat
  glitter: { name: 'Glitter', date: '2019-03-30',
             time: { end: '2019-11-30'},
             traits: ['rorschach', 'juju', 'unicorn', 'hyacinth']
           },


  # Mar 26, 2019
  # Sir Meowsalot Exclusive Cat is released. Exclusive Cat
  sirmeowsalot: { name: 'Sir Meowsalot', date: '2019-03-26',
                  limit: 21, ids: (201..221).to_a,
                  exclusive: true },

  # Mar 16, 2019
  # Clover Fancy Cat is discovered. Fancy Cat
  clover: { name: 'Clover', date: '2019-03-16',
            limit: 2506,
            traits: ['shamrock', 'emeraldgreen', 'roadtogold', 'PU27'],
            desc: "Celebrating St. Patrick's Day 2019 (March/19th)" },

  # Mar 2, 2019
  # Glasswalker Fancy Cat is discovered. Fancy Cat
  glasswalker: { name: 'Glasswalker', date: '2019-03-02',
                  limit: 1230,
                  traits: ['cloudwhite', 'henna', 'pearl', 'firedup'],
                  desc: "Ninja Fancy Cat"
                },

  cyberberry: { name: 'Cyber Berry', limit: 1, ids: [282],
              date: '2019-03-02',
              exclusive: true,
              desc: "Winner of the NFTme Sweetstakes" },

  # Mar 1, 2019
  # Hinecatone Exclusive Cat is discovered. Exclusive Cat
  hinecatone: { name: 'Hinecatone', date: '2019-03-01', limit: 15,
                ids: [1423547, 1433380, 1433486, 1440835, 1453366, 1456935, 1456973, 1459319, 1463197, 1466118, 1474082, 1484593, 1484982, 1492154, 1498885],
                exclusive: true },

  # Feb 21, 2019
  # Ande Fancy Cat is discovered. Fancy Cat
  ande: { name: 'Ande', date: '2019-02-21',
          limit: 440,
          traits: ['munchkin', 'cashewmilk', 'moue', 'PU30', 'WE10']
        },
  # Feb 17, 2019
  # Al Fancy Cat is discovered. Fancy Cat
  al: { name: 'Al', date: '2019-02-17',
        time: { end: '2019-12-01'},
        traits: ['munchkin','moue','cashewmilk','brownies']
      },
  # Feb 16, 2019
  # Pizzazz Fancy Cat is discovered.Fancy Cat
  pizzazz: { name: 'Pizzazz', date: '2019-02-16',
             time: { end: '2019-12-01'},
             traits: ['mekong', 'scarlet', 'spangled', 'wonky']
           },

  # Feb 15, 2019
  # Felono Exclusive Cat is discovered. Exclusive Cat
  felono: { name: 'Felono', date: '2019-02-15', limit: 30,
            ids: [1394641, 1404595, 1406021, 1413065, 1414375, 1420553, 1421315, 1421864, 1424104 ,1425433, 1431823, 1435517, 1436333, 1449860, 1451482, 1455458, 1459320, 1462952, 1463069, 1476999, 1483225, 1487210, 1487551, 1489681, 1490345, 1491632, 1492206, 1492739, 1492817, 1498778],
            exclusive: true },

  # Feb 9, 2019
  # Miss Purrfect Fancy Cat is discovered.Fancy Cat
  misspurrfect: { name: 'Miss Purrfect', date: '2019-02-09',
                  limit: 1298,
                  traits: ['allyouneed', 'butterscotch', 'asif', 'satiated', 'flapflap'],
                  desc: "Celebrating St. Valentine's Day 2019 (Feb/14th)"
                },

  ## 2019
  ## January

  # Jan 26, 2019
  # Squib Fancy Cat is discovered. Fancy Cat
  squib: { name: 'Squib', date: '2019-01-26',
           limit: 1443,
           traits: ['oldlace', 'razzledazzle', 'buzzed', 'rollercoaster'],
           desc: 'Celebrating American Football Super Bowl LIII in 2019' },

  tallythepurrocious: { name: 'Tally The Purrocious', date: '2019-01-10',
                       limit:	3992, time: { end: '2019-01-21' },
                       traits: ['selkirk', 'koala', 'arcreactor', 'sully'],
                       desc: 'Gods Unchained Promotion - Mystical Cat Talisman' },
  aeoncat: { name: 'Aeoncat', date: '2019-01-10', limit: 380,
              time: { start: '2019-01-17', end: '2019-01-28' },
           desc: 'Goddess Aeona - Goddess of Nature - Gods Unchained Promotion',
           special: true },
  hypurrion: { name: 'Hypurrion', date: '2019-01-10', limit: 1, ids: [269],
             desc: 'Hyperion - Mythic Titan of Light - Gods Unchained Promotion',
             exclusive: true },

  ## 2018
  ## December
  catzy: { name: 'Catzy', date: '2018-12-31', limit: 10, ids: (1137653..1137662).to_a,
           special: true,
           desc: 'Changpeng "CZ" Zhao - CEO of Binance - Top 10 Blockchain Influencer of the Year 2018 by CoinDesk' },
  purremyallaire: { name: 'Purremy Allaire', date: '2018-12-31', limit: 10, ids: (1137663..1137672).to_a,
                    special: true,
                    desc: 'Jeremy Allaire - Top 10 Blockchain Influencer of the Year 2018 by CoinDesk' },
  genedough: { name: 'Gene Dough', date: '2018-12-23',
               limit: 1376, time: { end: '2019-01-07' },
                traits: ['hotcocoa', 'mittens', 'frosting'] },
  pawrula:  { name: 'Pawrula the Bright', date: '2018-12-15', time: { start: '2018-12-15', end: '2019-11-30' },
                traits: ['camo', 'butterscotch', 'fox'],
                desc: 'Neha Narula - Director of the Digital Currency Initiative at the MIT Media Lab' },

  ## November
  draco:                { name: 'Draco',    date: '2018-11-30', limit: 1115, time: { end: '2018-12-07' },
                          traits: ['toyger', 'martian', 'peppermint', 'dragonwings', 'SE03']},
  dracothemagnificent:  { name: 'Draco The Magnificent', date: '2018-11-27', 
                            limit: 12, exclusive: true, ids:	(270..281).to_a },
  bugcatv2:             { name: 'Bug Cat V2',            date: '2018-11-27', 
                            limit: 20, exclusive: true, ids: (167..186).to_a, desc: 'Bug Bounty II (Offers Contract) Kitty' },
  dracojunior: { name: 'Draco Junior',  date: '2018-11-26', 
                   limit: 1398, time: { end: '2018-12-07' },
                   traits: ['lynx', 'verdigris', 'dragontail', 'SE03']},
  dreggo:      { name: 'Dreggo',        date: '2018-11-21', 
                   limit: 3624, time: { end: '2018-12-07' },
                   traits: ['siberian', 'bananacream', 'SE03']},
  pickles:     { name: 'Pickles',      date: '2018-11-14',  limit: 303,
                 traits: ['lynx', 'martian', 'highsociety', 'emeraldgreen']},
  lilbub:      { name: 'Lil Bub Ub Bub (BUB)',   date: '2018-11-13',  
                   limit: 468, special: true },  ## for search use specialedition:

  lilbubthemagicalspacecat: { name: 'Lil Bub Ub Bub (BUB) The Magical Space Cat', date: '2018-11-13', 
                              limit: 3, exclusive: true, ids: [266,267,268] },

  ## October
  dukecat:       { name: 'Dukecat',       date: '2018-10-18', limit: 1366,
                   traits: ['cymric', 'periwinkle', 'simple', 'tongue']},
  sheilapurren:  { name: 'Sheila Purren', date: '2018-10-04', limit: 1971, desc: 'Sheila Warren Kitty-fied - Head of Blockchain and Distributed Ledger Technology at the World Economic Forum (WEF)',
                   traits: ['mauveover', 'icy', 'wingtips', 'fangtastic']},

  ## September
  pawzilla: { name: 'Pawzilla', date: '2018-09-22', limit: 1185,
              traits: ['jaguar', 'universe', 'atlantis', 'littlefoot']},
  vulcat:   { name: 'Vulcat',   date: '2018-09-12', limit: 1, exclusive: true, ids: [1000000], desc: '1 000 000th Kitty' },
  meowstro: { name: 'Meowstro', date: '2018-09-09', limit: 1698,
              traits: ['onyx', 'wowza', 'eclipse']},
  atlas:    { name: 'Atlas',    date: '2018-09-07', limit: 998,
              traits: ['highlander', 'kittencream', 'swarley', 'topoftheworld']},

  ## August
  vulcant:        { name: 'Vulcant',        date: '2018-08-31', limit: 20, exclusive: true, ids: [932914,937360,938299,946526,948925,949058,950617,952280,952981,956374,956908,958570,964205,967234,983046,984451,990713,992861,995745,997469] },
  purrity:        { name: 'Purrity',        date: '2018-08-23', limit: 5984,
                    traits: ['selkirk', 'chronic', 'cloudwhite', 'cheeky']},
  rabbidkitty:    { name: 'Rabbid Kitty',   date: '2018-08-23', limit: 6, exclusive: true, ids: (260..265).to_a, desc: 'Ubisoft Blockchain Heroes Hackathon' },
  squiddlesworth: { name: 'Squiddlesworth', date: '2018-08-16', limit: 1510, desc: 'Lava Squid Cat',
                     traits: ['sphynx', 'redvelvet', 'patrickstarfish', 'dragontail']},

  ## July
  purrspero:      { name: 'Purrspero',   date: '2018-07-27', limit: 4448,
                    traits: ['dippedcone', 'googly', 'royalpurple', 'beard']},
  catbury:        { name: 'Catbury',     date: '2018-07-25', limit: 76,
                     traits: ['ragdoll', 'crazy', 'chocolate', 'mintmacaron', 'yokel', 'WE02']},
  honu:           { name: 'Honu',        date: '2018-07-20', limit: 1, exclusive: true, ids: [251], desc: 'Kitties for Good - Save Turtle Habitats' },
  victoire:       { name: 'Victoire',    date: '2018-07-18', limit: 1, exclusive: true, ids: [402], desc: 'France Football World Cup Champion' },
  lulu:           { name: 'Lulu',        date: '2018-07-13', limit: 999,
                    traits: ['cyan', 'verdigris', 'turtleback', 'salty']},
  boot:           { name: 'Boot',        date: '2018-07-05', limit: 1440,  desc: 'Football World Cup',
                    traits: ['ganado', 'wiley', 'cerulian', 'rollercoaster'],
                    variants: {
                      belgium: { name: 'Belgium', limit: 97,   traits: [['orangesoda','onyx']]},                    ## Base Color: Orangesoda / Onyx
                      brazil:  { name: 'Brazil',  limit: 195,  traits: [['hintomint','bananacream','verdigris']]},  ## Base Color: Hintomint / Bananacream / Verdigris
                      croatia: { name: 'Croatia', limit: 253,  traits: [['cottoncandy','mauveover','oldlace']]},    ## Base Color: Cottoncandy / Mauveover / Oldlace
                      england: { name: 'England', limit: 168,  traits: [['greymatter','martian']]},                 ## Base Color: Greymatter / Martian
                      france:  { name: 'France',  limit: 317,  traits: [['harbourfog','cinderella','lavender']]},   ## Base Color: Harbourfog / Cinderella / Lavender
                      russia:  { name: 'Russia',  limit: 94,   traits: [['shadowgrey','salmon','cloudwhite']]},     ## Base Color: Shadowgrey / Salmon/ Cloudwhite
                      sweden:  { name: 'Sweden',  limit: 123,  traits: [['brownies','dragonfruit','redvelvet']]},   ## Base Color: Brownies / Dragonfruit / Redvelvet
                      uruguay: { name: 'Uruguay', limit: 193,  traits: [['aquamarine','nachocheez','koala']]},      ## Base Color: Aquamarine / Nachocheez / Koala
                    },
                  },
  ## note: boot - different variants for world cup teams
  ##  Although there are 8 unique Fancies, they're actually each a variant on the same Fancy - Boot.
  ##  Their colours are different, and you can collect all 8 as a set

  ## June
  raspoutine:    { name: 'Raspoutine',  date: '2018-06-28', limit: 1867,
                    traits: ['buzzed', 'nachocheez', 'sandalwood', 'belch']},
  furlin:        { name: 'Furlin',      date: '2018-06-26', limit: 52, exclusive: true, ids: (115..126).to_a + (128..166).to_a },
  kittypride:    { name: 'Kitty Pride', date: '2018-06-21', limit: 1316,
                    traits: ['fabulous','cinderella','garnet']},
  furrmingo:     { name: 'Furrmingo',   date: '2018-06-14', limit: 333,
                    traits: ['bobtail', 'egyptiankohl', 'flamingo', 'whixtensions']},

  ## May
  page:              { name: 'Page',              date: '2018-05-31',  limit: 50_000,
                       traits: ['rascal', 'peach', 'wasntme' ]},
  "schrödingerscat": { name: "Schrödinger's Cat", date: '2018-05-20',  limit: 73,
                        traits: ['forgetmenot','tinybox','PU20','SE25']},
  chatplongeur:      { name: 'Chat Plongeur',     date: '2018-05-19',  limit: 1910,
                        traits: ['aquamarine', 'skyblue', 'seafoam']},
  docpurr:             { name: 'Doc Purr',         date: '2018-05-16',  limit: 250,
                          traits: ['persian','spock','raisedbrow','violet','tongue']},
  celestialcyberdimension: { name: 'Celestial Cyber Dimension', date: '2018-05-12', limit: 1, exclusive: true, ids: [127] },
  swish:               { name: 'Swish', date: '2018-05-08', limit: 2880,
                          traits: ['norwegianforest', 'luckystripe', 'thicccbrowz', 'orangesoda']},

  ## April
  flutterbee:  { name: 'Flutterbee', date: '2018-04-28', limit: 275,
                 traits: ['cloudwhite','jaguar','lemonade','azaleablush','WE14']},
  vernon:      { name: 'Vernon',     date: '2018-04-16', limit: 320, desc: 'Spring Equinox Kitty',
                  traits: ['amur','fabulous','cottoncandy','springcrocus','belleblue','soserious']},  ## first, see https://www.cryptokitties.co/kitty/696398

  ## March
  berry:           { name: 'Berry',   date: '2018-03-16', limit: 200,
                     traits: ['dragonfruit','thunderstruck','emeraldgreen','apricot','simple']},
  pussforprogress: { name: 'Puss For Progress', date: '2018-03-08', limit: 1920, desc: "Women's Day",
                     traits: ['himalayan','peach','safetyvest','gerbil']},
  fortunecat:      { name: 'Fortune Cat', name_cn: '红包喵', date: '2018-03-08', limit: 888,
                      traits: ['harbourfog','calicool','swampgreen','sapphire','beard']},  ## todo: check date for china launch specials!!!
  goldendragoncat: { name: 'Golden Dragon Cat', name_cn: '帝龙喵', date: '2018-03-08', limit: 1, exclusive: true, ids: [888], desc: 'China Launch' }, ## todo: check date for china launch specials!!!
  goldendogcat:    { name: 'Golden Dog Cat', name_cn: '旺财汪', date: '2018-03-08', limit: 11, exclusive: true, ids: [1802,1803,1805,1806,1808,1809,1812,1816]+(1825..1828).to_a, desc: 'China Launch' },  ## todo: check date for china launch specials!!!
  liondance:    { name: 'Lion Dance', name_cn: '咚咚锵', date: '2018-03-07', limit: 888, overflow: 1,
                    traits: ['manx','royalblue','googly','starstruck']},
  dogcat:       { name: 'Dog Cat',    name_cn: '汪星爷', date: '2018-03-02', limit: 88, desc: 'Year of the Dog (Greater China)',
                   traits: ['tigerpunk','periwinkle','barkbrown','sweetmeloncakes','yokel']},
  knightkitty:  { name: 'Knight Kitty',  date: '2018-03-01',  limit: 11, exclusive: true, ids: (104..114).to_a },

  ## February
  tabby:           { name: 'Tabby',           date: '2018-02-26', limit: 250,
                      traits: ['ragamuffin','morningglory','otaku','cheeky']},
  yuricatsuki:     { name: 'Yuri Catsuki',    date: '2018-02-20', limit: 250,  desc: 'Figure Scating Kitty - Winter Olympics (Korea)',
                       traits: ['cymric','tiger','neckbeard','elk']},
  misterpurrfect:  { name: 'Mister Purrfect', date: '2018-02-14', limit: 1000, desc: "Valentine's Day",
                        traits: ['chocolate','baddate','strawberry','wuvme']},
  earnie:          { name: 'Earnie',          date: '2018-02-13', limit: 500,  desc: 'Earn.com - Golden Kitty Award (Product Hunt)',
                        traits: ['birman','orangesoda','hotrod','grim']},
  cathena:         { name: 'Cathena',         date: '2018-02-06', limit: 1,  exclusive: true, ids: [500000], desc: '500 000th Kitty' },

  ## January
  'momo-chan':     { name: 'Momo-chan',       date: '2018-01-31',  limit: 500, desc: 'Ninja Kitty',
                       traits: ['onyx','henna','bloodred','wolfgrey','sass']},
  negato:          { name: 'Negato',          date: '2018-01-29',  limit: 500, desc: 'Ninja Kitty',
                       traits: ['onyx','henna','wolfgrey','slyboots']},
  stitches:        { name: 'Stitches',         date: '2018-01-10',  limit: 500, desc: 'Zombie Kitty',
                       traits: ['hintomint','seafoam','swampgreen','saycheese']},

  ## 2017
  ## December
  phuziqaat:    { name: 'Phu Ziqaat',    date: '2017-12-31',  limit: 1000,  desc: 'Alien Kitty',
                   traits: ['chartreux','spock','alien','pouty']},
  santaclaws:   { name: 'Santa Claws',   date: '2017-12-12',  limit: 1000, overflow: 2, desc: 'Ho Ho Ho - Santa Claus Kitty',
                    traits: ['cloudwhite','scarlet','beard','wild_d']},
  mistletoe:    { name: 'Mistletoe',     date: '2017-12-09',  limit: 2000,  desc: "XMas Kitty",
                   traits: ['oldlace','crazy','gerbil']},
  dracula:      { name: 'Dracula',       date: '2017-12-01',  limit: 2000,
                   traits: ['laperm','spock','strawberry','WE01']},

  ## November
  ducat:        { name: 'Du Cat',        date: '2017-11-29',  limit: 10_000,
                    traits: ['cymric','tongue']},
  genesis:      { name: 'Genesis',       date: '2017-11-24',  limit: 1,     exclusive: true, ids: [1],  desc: '1st Kitty'},
  shipcat:      { name: 'Ship Cat',      date: '2017-11-23',  limit: 2000,
                    traits: ['sphynx','orangesoda','luckystripe','crazy']},
  bugcat:       { name: 'Bug Cat',       date: '2017-11-23',  limit: 3,     exclusive: true, ids: [101,102,103], desc: 'Bug Bounty Kitty' },
}
