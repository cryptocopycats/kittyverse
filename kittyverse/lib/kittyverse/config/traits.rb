# encoding: utf-8

###
#  trais / kaittributes
#   see https://cryptokittydex.com/kaittributes
#       https://docs.google.com/spreadsheets/d/1ShiBKSglFAB2vJe4Uow3iF09FBVq6ZAaOzTCIECf4iA
#       http://www.rolldice.club/cryptokitties/wkt_tree.php
#       https://www.cryptokitties.co/cattributes (official cattributes list)
#
#
#  for latest updates on new cattributes see:
#      https://updates.cryptokitties.co   (official latest updates/timeline)

## ordered by gene position (0,1,3.4,5,... etc.)
##  12 traits (4 genes each)
TRAITS =
{
  body: {
    genes: '0-3',
    name:  'Fur',  code: 'FU',
    kai: {
    '1' => 'Savannah',
    '2' => 'Selkirk',
    '3' => 'Chantilly',
    '4' => 'Birman',
    '5' => 'Koladiviya',
    '6' => 'Bobtail',
    '7' => 'Manul',
    '8' => 'Pixiebob',
    '9' => 'Siberian',
    'a' => 'Cymric',
    'b' => 'Chartreux',
    'c' => 'Himalayan',
    'd' => 'Munchkin',
    'e' => 'Sphynx',
    'f' => 'Ragamuffin',
    'g' => 'Ragdoll',
    'h' => 'Norwegianforest',
    'i' => 'Mekong',
    'j' => 'Highlander',
    'k' => 'Balinese',
    'm' => 'Lynx',
    'n' => 'Mainecoon',
    'o' => 'Laperm',
    'p' => 'Persian',
    'q' => 'Fox',
    'r' => 'Kurilian',
    's' => 'Toyger',
    't' => 'Manx',
    'u' => 'Lykoi',
    'v' => 'Burmilla',
    'w' => 'Liger',
    'x' => ''
    }
  },
  pattern: {
    genes: '4-7',
    name: 'Pattern', code: 'PA',
    kai: {
    '1' => 'Vigilante',
    '2' => 'Tiger',
    '3' => 'Rascal',
    '4' => 'Ganado',
    '5' => 'Leopard',
    '6' => 'Camo',
    '7' => 'Rorschach',
    '8' => 'Spangled',
    '9' => 'Calicool',
    'a' => 'Luckystripe',
    'b' => 'Amur',
    'c' => 'Jaguar',
    'd' => 'Spock',
    'e' => 'Mittens',
    'f' => 'Totesbasic 1',   ## use totesbasic_f or totesbasic (14) - why? why not?
    'g' => 'Totesbasic 2',   ## use totesbasic_g or totesbasic (15)
    'h' => 'Splat',
    'i' => 'Thunderstruck',
    'j' => 'Dippedcone',
    'k' => 'Highsociety',
    'm' => 'Tigerpunk',
    'n' => 'Henna',
    'o' => 'Arcreactor',
    'p' => 'Totesbasic 3',   ## use totesbasic_p or totesbasic (23) - why? why not?
    'q' => 'Scorpius',
    'r' => 'Razzledazzle',
    's' => 'Hotrod',
    't' => 'Allyouneed',
    'u' => 'Avatar',
    'v' => 'Gyre',
    'w' => 'Moonrise',
    'x' => ''
    }
  },
  coloreyes: {
    genes: '8-11',
    name:  'Eye Color', code: 'EC',
    kai: {
    '1' => 'Thundergrey',
    '2' => 'Gold',
    '3' => 'Topaz',
    '4' => 'Mintgreen',
    '5' => 'Isotope',
    '6' => 'Sizzurp',
    '7' => 'Chestnut',
    '8' => 'Strawberry',
    '9' => 'Sapphire',
    'a' => 'Forgetmenot',
    'b' => 'Dahlia',
    'c' => 'Coralsunrise',
    'd' => 'Olive',
    'e' => 'Doridnudibranch',
    'f' => 'Parakeet',
    'g' => 'Cyan',
    'h' => 'Pumpkin',
    'i' => 'Limegreen',
    'j' => 'Bridesmaid',
    'k' => 'Bubblegum',
    'm' => 'Twilightsparkle',
    'n' => 'Palejade',
    'o' => 'Pinefresh',
    'p' => 'Eclipse',
    'q' => 'Babypuke',
    'r' => 'Downbythebay',
    's' => 'Autumnmoon',
    't' => 'Oasis',
    'u' => 'Gemini',
    'v' => 'Dioscuri',
    'w' => 'Kaleidoscope',
    'x' => ''
    }
  },
  eyes: {
    genes: '12-15',
    name: 'Eye Shape', code: 'ES',     ##  eye type
    kai: {
    '1' => 'Swarley',
    '2' => 'Wonky',
    '3' => 'Serpent',
    '4' => 'Googly',
    '5' => 'Otaku',
    '6' => 'Simple',
    '7' => 'Crazy',
    '8' => 'Thicccbrowz',
    '9' => 'Caffeine',
    'a' => 'Wowza',
    'b' => 'Baddate',
    'c' => 'Asif',
    'd' => 'Chronic',
    'e' => 'Slyboots',
    'f' => 'Wiley',
    'g' => 'Stunned',
    'h' => 'Chameleon',
    'i' => 'Alien',
    'j' => 'Fabulous',
    'k' => 'Raisedbrow',
    'm' => 'Tendertears',
    'n' => 'Hacker',
    'o' => 'Sass',
    'p' => 'Sweetmeloncakes',
    'q' => 'Oceanid',
    'r' => 'Wingtips',
    's' => 'Firedup',
    't' => 'Buzzed',
    'u' => 'Bornwithit',
    'v' => 'Candyshoppe',
    'w' => 'Drama',
    'x' => ''
    }
  },
  colorprimary: {
    genes: '16-19',
    name: 'Base Color', code: 'BC',   ##  color1 / colorprimary / body color
    kai: {
    '1' => 'Shadowgrey',
    '2' => 'Salmon',
    '3' => 'Meowgarine',
    '4' => 'Orangesoda',
    '5' => 'Cottoncandy',
    '6' => 'Mauveover',
    '7' => 'Aquamarine',
    '8' => 'Nachocheez',
    '9' => 'Harbourfog',
    'a' => 'Cinderella',
    'b' => 'Greymatter',
    'c' => 'Tundra',
    'd' => 'Brownies',
    'e' => 'Dragonfruit',
    'f' => 'Hintomint',
    'g' => 'Bananacream',
    'h' => 'Cloudwhite',
    'i' => 'Cornflower',
    'j' => 'Oldlace',
    'k' => 'Koala',
    'm' => 'Lavender',
    'n' => 'Glacier',
    'o' => 'Redvelvet',
    'p' => 'Verdigris',
    'q' => 'Icicle',
    'r' => 'Onyx',
    's' => 'Hyacinth',
    't' => 'Martian',
    'u' => 'Hotcocoa',
    'v' => 'Shamrock',
    'w' => 'Firstblush',
    'x' => ''
    }
  },
  colorsecondary: {
    genes: '20-23',
    name:  'Highlight Color', code: 'HC',    ## color2 / colorsecondary / sec color / pattern color
    kai: {
    '1' => 'Cyborg',
    '2' => 'Springcrocus',
    '3' => 'Egyptiankohl',
    '4' => 'Poisonberry',
    '5' => 'Lilac',
    '6' => 'Apricot',
    '7' => 'Royalpurple',
    '8' => 'Padparadscha',
    '9' => 'Swampgreen',
    'a' => 'Violet',
    'b' => 'Scarlet',
    'c' => 'Barkbrown',
    'd' => 'Coffee',
    'e' => 'Lemonade',
    'f' => 'Chocolate',
    'g' => 'Butterscotch',
    'h' => 'Ooze',
    'i' => 'Safetyvest',
    'j' => 'Turtleback',
    'k' => 'Rosequartz',
    'm' => 'Wolfgrey',
    'n' => 'Cerulian',
    'o' => 'Skyblue',
    'p' => 'Garnet',
    'q' => 'Peppermint',
    'r' => 'Universe',
    's' => 'Royalblue',
    't' => 'Mertail',
    'u' => 'Inflatablepool',
    'v' => 'Pearl',
    'w' => 'Prairierose',
    'x' => ''
    }
  },
  colortertiary: {
    genes: '24-27',
    name: 'Accent Color', code: 'AC',   ## color3 / colortertiary
    kai: {
    '1' => 'Belleblue',
    '2' => 'Sandalwood',
    '3' => 'Peach',
    '4' => 'Icy',
    '5' => 'Granitegrey',
    '6' => 'Cashewmilk',
    '7' => 'Kittencream',
    '8' => 'Emeraldgreen',
    '9' => 'Kalahari',
    'a' => 'Shale',
    'b' => 'Purplehaze',
    'c' => 'Hanauma',
    'd' => 'Azaleablush',
    'e' => 'Missmuffett',
    'f' => 'Morningglory',
    'g' => 'Frosting',
    'h' => 'Daffodil',
    'i' => 'Flamingo',
    'j' => 'Buttercup',
    'k' => 'Bloodred',
    'm' => 'Atlantis',
    'n' => 'Summerbonnet',
    'o' => 'Periwinkle',
    'p' => 'Patrickstarfish',
    'q' => 'Seafoam',
    'r' => 'Cobalt',
    's' => 'Mallowflower',
    't' => 'Mintmacaron',
    'u' => 'Sully',
    'v' => 'Fallspice',
    'w' => 'Dreamboat',
    'x' => ''
    }
  },
  wild: {
    genes: '28-31',
    name: 'Wild Element', code: 'WE',
    kai: {
    'h' => 'Littlefoot',
    'i' => 'Elk',
    'j' => 'Ducky',
    'k' => 'Trioculus',
    'm' => 'Daemonwings',
    'n' => 'Featherbrain',
    'o' => 'Flapflap',
    'p' => 'Daemonhorns',
    'q' => 'Dragontail',
    'r' => 'Aflutter',
    's' => 'Foghornpawhorn',
    't' => 'Unicorn',
    'u' => 'Dragonwings',
    'v' => 'Alicorn',
    'w' => 'Wyrm',
    'x' => ''
    }
  },
  mouth: {
    genes: '32-35',
    name:  'Mouth', code: 'MO',
    kai: {
    '1' => 'Whixtensions',
    '2' => 'Wasntme',
    '3' => 'Wuvme',
    '4' => 'Gerbil',
    '5' => 'Confuzzled',
    '6' => 'Impish',
    '7' => 'Belch',
    '8' => 'Rollercoaster',
    '9' => 'Beard',
    'a' => 'Pouty',
    'b' => 'Saycheese',
    'c' => 'Grim',
    'd' => 'Fangtastic',
    'e' => 'Moue',
    'f' => 'Happygokitty',
    'g' => 'Soserious',
    'h' => 'Cheeky',
    'i' => 'Starstruck',
    'j' => 'Samwise',
    'k' => 'Ruhroh',
    'm' => 'Dali',
    'n' => 'Grimace',
    'o' => 'Majestic',
    'p' => 'Tongue',
    'q' => 'Yokel',
    'r' => 'Topoftheworld',
    's' => 'Neckbeard',
    't' => 'Satiated',
    'u' => 'Walrus',
    'v' => 'Struck',
    'w' => 'Delite',
    'x' => ''
   }
  },
  environment: {
      genes: '36-39',
      name: 'Environment', code: 'EN',
      kai: {
        'h' => 'Salty',
        'i' => 'Dune',
        'j' => 'Juju',
        'k' => 'Tinybox',
        'm' => 'Myparade',
        'n' => 'Finalfrontier',
        'o' => 'Metime',
        'p' => 'Drift',
        'q' => 'Secretgarden',
        'r' => 'Frozen',
        's' => 'Roadtogold',
        't' => 'Jacked',
        'u' => 'Floorislava',
        'v' => 'Prism',
        'w' => 'Junglebook',
        'x' => ''
      }
  },
  secret: {
      genes: '40-43',
      name: 'Secret Y Gene', code: 'SE',   ## todo: change to Y Gene or Y (see https://guide.cryptokitties.co/guide/cat-features/genes)
      kai: { }
  },
  prestige: {
      genes: '44-47',
      name: 'Purrstige', code: 'PU',
      kai: { }
      ##  prune, furball, duckduckcat, or thatsawrap - more like fancies (not really traits)
  }
}


# quick hack - map copycats keys to (internal) cryptokitties trait type keys
#  note: all keys are the same except:
ALT_TRAIT_TYPE_KEYS =
{
  :color1    => :colorprimary,
  :color2    => :colorsecondary,
  :color3    => :colortertiary,
  :purrstige => :prestige,
  ## add :fur, etc. too - why? why not?
}

ALT_TRAIT_TYPE_NAMES =
{
  'body'             => 'fur',
  'eyes'             => 'eye shape',
  'eye type'         => 'eye shape',
  'body color'       => 'base color',
  'primary color'    => 'base color',
  'base colour'      => 'base color',       # british (canadian) spelling
  'secondary color'  => 'highlight color',
  'sec color'        => 'highlight color',
  'pattern color'    => 'highlight color',
  'highlight colour' => 'highlight color',  # british (canadian) spelling
  'tertiary color'   => 'accent color',
  'accent colour'    => 'accent color',     # british (canadian) spelling
  'wild'             => 'wild element',
  'secret'           => 'secret y gene',
  'prestige'         => 'purrstige',
}

ALT_TRAIT_NAMES =
{
  'totesbasic (14)' => 'totesbasic 1',
  'totesbasic (15)' => 'totesbasic 2',
  'totesbasic (23)' => 'totesbasic 3',
  'totesbasic_14'   => 'totesbasic 1',
  'totesbasic_15'   => 'totesbasic 2',
  'totesbasic_23'   => 'totesbasic 3',
  'totesbasic 14'   => 'totesbasic 1',
  'totesbasic 15'   => 'totesbasic 2',
  'totesbasic 23'   => 'totesbasic 3',

  'totesbasic (f)'  => 'totesbasic 1',
  'totesbasic (g)'  => 'totesbasic 2',
  'totesbasic (p)'  => 'totesbasic 3',
  'totesbasic f'    => 'totesbasic 1',
  'totesbasic g'    => 'totesbasic 2',
  'totesbasic p'    => 'totesbasic 3',
  'totesbasic_f'    => 'totesbasic 1',
  'totesbasic_g'    => 'totesbasic 2',
  'totesbasic_p'    => 'totesbasic 3',

  'totesbasic_1'    => 'totesbasic 1',
  'totesbasic_2'    => 'totesbasic 2',
  'totesbasic_3'    => 'totesbasic 3',
}

## note: totesbasic has three traits / genes
TOTESBASIC = ['Totesbasic 1', 'Totesbasic 2', 'Totesbasic 3']    ## was: ['PA14', 'PA15', 'PA23']
ANY_TOTESBASIC = ALL_TOTESBASIC = TOTESBASIC
