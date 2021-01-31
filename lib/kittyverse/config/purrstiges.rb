###########################################
## Purrstige Traits  / Cattributes


## trait recipe helpers / shortcuts
EN00_EN15 = ['EN00','EN01','EN02','EN03',
             'EN04','EN05','EN06','EN07',
             'EN08','EN09','EN10','EN11',
             'EN12','EN13','EN14','EN15']  #  Any non-visible Env (EN00-EN15)

PU16_PU29 = ['PU16','PU17','PU18','PU19',
             'PU20','PU21','PU22','PU23',
             'PU24','PU25','PU26','PU27',
             'PU28','PU29' ]
PU24_PU27 = ['PU24','PU25','PU26','PU27']
PU24_PU30 = ['PU24','PU25','PU26','PU27',
             'PU28','PU29','PU30']
PU28_PU29 = ['PU28','PU29']
PU28_PU30 = ['PU28','PU29','PU30']


WE00_WE07 = ['WE00', 'WE01', 'WE02', 'WE03',
             'WE04', 'WE05', 'WE06', 'WE07']
WE00_WE15 = ['WE00', 'WE01', 'WE02', 'WE03',
             'WE04', 'WE05', 'WE06', 'WE07',
             'WE08', 'WE09', 'WE10', 'WE11',
             'WE12', 'WE13', 'WE14', 'WE15']



PURRSTIGES_HACKATAO = {
#  24.10.20 - New Purrstige - Meowfoolest
meowfoolest:  { name: 'Meowfoolest',
                recipe: {
                  time: { start: '2020-10-24', end: '2020-10-31'}, count: 254,
                  traits: ['liger', 'shale', 'PU30', 'daemonwings'] },
              },
#  24.10.20 - New Purrstige - Meowfool
meowfool: { name: 'Meowfool',
            recipe: {
              time: { start: '2020-10-24', end: '2020-10-31'}, count: 388,
              traits: ['shale', 'daemonwings', PU28_PU29] },
          },
#  24.10.20 - New Purrstige - Meownificent
meownificent:  { name: 'Meownificent',
                 recipe: {
                 time: { start: '2020-10-24', end: '2020-10-31'}, count: 260,
                 traits: [ 'liger', 'shale', 'PU30', WE00_WE15] },
              },
#  24.10.20 - New Purrstige - Meowthulhu
meowthulhu: { name: 'Meowthulhu',
              recipe: {
                time: { start: '2020-10-24', end: '2020-10-31'}, count: 950,
                traits: [ 'daemonwings', PU28_PU30] },
            },
#  24.10.20 - New Purrstige - Meownique
meownique: { name: 'Meownique',
             recipe: {
               time: { start: '2020-10-24', end: '2020-10-31'}, count: 557,
               traits: [ 'shale', PU28_PU29, WE00_WE15] },
           },
}



PURRSTIGES_KITTENHEIM = {
# 07.11.19 - New Purrstige - Purrior
purrior:  { name: 'Purrior',
            recipe: {
              time: { start: '2019-11-07', end: '2019-12-01' }, count: 120,
              traits: [] },
          },
# 06.11.19 - New Purrstige - Centurion
centurion: { name: 'Centurion',
             recipe: {
               time: { start: '2019-11-06', end: '2019-12-01' }, count: 144,
               traits: [] },
           },
# 03.11.19 - New Purrstige - Explorer
explorer: { name: 'Explorer',
            recipe: {
              time: { start: '2019-11-03', end: '2019-12-01' }, count: 162,
              traits: ['lykoi', 'daemonhorns', ['rascal', 'camo'], 'PU28'] },
          },
# 02.11.19 - New Purrstige - Guard
guard: { name: 'Guard',
         recipe: {
           time: { start: '2019-11-02', end: '2019-12-01' }, count: 220,
           traits: [] },
       },
# 01.11.19 - New Purrstige - Velite
velite: { name: 'Velite',
          recipe: {
            time: { start: '2019-11-01', end: '2019-12-01' }, count: 273,
            traits: [] },
        },
# 01.11.19 - New Purrstige - Scout
scout: { name: 'Scout',
         recipe: {
          time: { start: '2019-11-01', end: '2019-12-01' }, count: 140,
          traits: [] },
       },
# 02.11.19 - New Purrstige - Dominator
dominator: { name: 'Dominator',
             recipe: {
               time: { start: '2019-11-02', end: '2019-12-01' }, count: 141,
               traits: ['lykoi', 'daemonhorns', PU24_PU27]  },
           },

# Nov 1, 2019 - Brassard trait is discovered. Purrstige
brassard: { name: 'Brassard',
            recipe: {
              time: { start: '2019-11-01', end: '2019-12-01' }, count: 793,
              traits: [WE00_WE07, PU24_PU27] },
          },

# Nov 1, 2019 - Aegis trait is discovered.  Purrstige
aegis: { name: 'Aegis',
         recipe: {
           time: { start: '2019-11-01', end: '2019-12-01' }, count: 617,
           traits: [] },
       },
}


PURRSTIGES_ROBOKITTY = {
###
# May 1, 2019
#  7 Robokitty Purrstiges

# 12.12.19  - New Purrstige - Driver
driver:     { name: 'Driver',
              recipe: {
                time: { start: '2019-12-12', end: '2019-12-13' }, count: 257,
                traits: ['ragdoll', TOTESBASIC, WE00_WE15, 'drift', PU24_PU30] },
            },
bionic: { name: 'Bionic',
          recipe: {
            time: { start: '2019-05-01', end: '2019-08-31' }, count: 624,
            traits: ['ragdoll', 'WE05', TOTESBASIC, 'PU30'] }
          },
fileshare: { name: 'Fileshare',
             recipe: {
               time: { start: '2019-05-01', end: '2019-08-31' }, count: 683,
               traits: ['ragdoll', 'WE05', TOTESBASIC, 'PU29'] }
           },
pawsfree:  { name: 'Pawsfree',
             recipe: {
               time: { start: '2019-05-01', end: '2019-08-31' }, count: 430,
               traits: ['ragdoll', 'WE05', TOTESBASIC, 'PU28'] }
             },
uplink:  { name: 'Uplink',
           recipe: {
             time: { start: '2019-05-01', end: '2019-08-31' }, count: 1151,
             traits: ['ragdoll', 'WE05', TOTESBASIC, 'PU27'] }
           },
gaunlet: { name: 'Gauntlet',
           recipe: {
             time: { start: '2019-05-01', end: '2019-08-31' }, count: 905,
             traits: ['ragdoll', 'WE05', TOTESBASIC, 'PU26'] }
           },
catterypack: { name: 'Catterypack',
               recipe: {
                 time: { start: '2019-05-01', end: '2019-08-31' }, count: 513,
                 traits: ['ragdoll', 'WE05', TOTESBASIC, 'PU25'] }
               },
squelch: { name: 'Squelch',
           recipe: {
             time: { start: '2019-05-01', end: '2019-08-31' },  count: 828,
             traits: ['ragdoll', 'WE05', TOTESBASIC, 'PU24'] }
            }
}


PURRSTIGES_PIRATE = {
##
# Apr 13, 2019
#  7 Pirate Purrstiges
#  Scratchingpost trait is discovered. Purrstige
scratchingpost: { name: 'Scratchingpost',
                  recipe: {
                    time: { start: '2019-04-13', end: '2019-05-10' }, count: 772,
                    traits: ['WE10', 'PU26'] }
                },
#  Hooked trait is discovered. Purrstige
hooked: { name: 'Hooked',
          recipe: {
            time: { start: '2019-04-13', end: '2019-05-10' }, count: 1277,
            traits: ['WE10', 'PU27'] }
        },
#  Landlubber trait is discovered. Purrstige
landlubber: { name: 'Landlubber',
              recipe: {
                time: { start: '2019-04-13', end: '2019-05-10' }, count: 711,
                traits: ['WE10', 'PU29'] }
            },
# Wrecked trait is discovered. Purrstige
wrecked: { name: 'Wrecked',
           recipe: {
             time: { start: '2019-04-13', end: '2019-05-10' }, count: 959,
             traits: ['EN00', 'PU26'] }
          },
# Purrbados trait is discovered. Purrstige
purrbados: { name: 'Purrbados',
             recipe: {
               time: { start: '2019-04-13', end: '2019-05-10' }, count: 1344,
               traits: ['EN01', 'PU26'] }
            },
# Timbers trait is discovered. Purrstige
timbers: { name: 'Timbers',
           recipe: {
             time: { start: '2019-04-13', end: '2019-05-10' }, count: 472,
             traits: ['WE10', 'EN00', 'PU26'] }
          },
# Maraud trait is discovered. Purrstige
maraud: { name: 'Maraud',
          recipe: {
            time: { start: '2019-04-13', end: '2019-05-10' }, count: 620,
            traits: ['WE10', 'EN01', 'PU26'] }
        }
}


PURRSTIGES_ALPACAT = {
##
# Feb 21, 2019
#  7 Alpacat "hairstyle" purrstiges
# Dreamcloud trait is discovered. Purrstige
dreamcloud: { name: 'Dreamcloud',
              recipe: {
                time: { start: '2019-02-22', end: '2019-03-25' }, count: 1246,
                traits: ['munchkin', 'WE10', 'PU24'] }
            },
# Alpunka trait is discovered. Purrstige
alpunka: { name: 'Alpunka',
           recipe: {
             time: { start: '2019-02-22', end: '2019-03-25' }, count: 926,
             traits: ['munchkin', 'WE10', 'PU28'] }
         },
# Cindylou trait is discovered. Purrstige
cindylou: { name: 'Cindylou',
            recipe: {
              time: { start: '2019-02-22', end: '2019-03-25' }, count: 905,
              traits: ['munchkin', 'WE10', 'PU30'] }
          },
# Alpacacino trait is discovered. Purrstige
alpacacino: { name: 'Alpacacino',
              recipe: {
                time: { start: '2019-02-22', end: '2019-03-25' }, count: 1220,
                traits: ['munchkin', 'WE10', 'PU27'] }
            },
# Beatlesque trait is discovered. Purrstige
beatlesque: { name: 'Beatlesque',
              recipe: {
                time: { start: '2019-02-22', end: '2019-03-25' }, count: 783,
                traits: ['munchkin', 'WE10', 'PU29'] }
            },
# Huacool trait is discovered. Purrstige
huacool: { name: 'Huacool',
           recipe: {
             time: { start: '2019-02-22', end: '2019-03-25' }, count: 837,
             traits: ['munchkin', 'WE10', 'PU25'] }
          },
# Inaband trait is discovered. Purrstige
inaband: { name: 'Inaband',
           recipe: {
             time: { start: '2019-02-22', end: '2019-03-25' }, count: 1048,
             traits: ['munchkin', 'WE10', 'PU26'] }
        }
}





###############
##  todo:
##   - use PURRSTIGES_XMAS?! and other themes too - why? why not?

## thatsawrap: { date: '2018-10-21' },    ## prestige
## duckduckcat: { date: '2018-10-19' },   ## prestige

## prune: { date: '2018-09-19' },     ## prestige
## furball: { date: '2018-09-19' },   ## prestige


PRESTIGES = PURRSTIGES =
{

# 01.01.20  - New Purrstige - Confettibox
confettibox: { name: 'Confettibox',
              recipe: {
                time: { start: '2020-01-01', end: '2020-01-15' }, count: 554,
                traits: ['tinybox', 'PU26'] },
            },
# 01.12.19  - New Purrstige - Celebration
celebration: { name: 'Celebration',
               recipe: {
                time: { start: '2019-12-01', end: '?' }, count: 1080,
                traits: [EN00_EN15, PU16_PU29] },
             },
# 01.12.19 - New Purrstige - Grandfinale
grandfinale: { name: 'Grandfinale',
               recipe: {
                 time: { start: '2019-12-01', end: '?' }, count: 520,
                 traits: [EN00_EN15, 'PU30'] },
             },



# Jun 28, 2019 -  Werekitty trait is discovered. Purrstige
werekitty: { name: 'Werekitty',
             recipe: {
               time: { start: '2019-06-28', end: '2019-07-27' }, count: 438,
               traits: ['moonrise', 'littlefoot', 'PU24',
                        EN00_EN15] },
               desc: 'Monster Month Purrstige Trait'
            },

##
# Mar 15, 2019
# Oohshiny trait is discovered. Purrstige
oohshiny: { name: 'Oohshiny',
            recipe: {
              time: { start: '2019-03-15', end: '2019-03-28'}, count: 2484,
              traits: ['roadtogold', 'PU27'] }
          },

## 2018
## December

 reindeer: { name: 'Reindeer',
             recipe: {
               time: { start: '2018-12-14', end: '2019-01-07' }, count: 854,
               traits: ['elk', ['PU24','PU25','PU26','PU27']] }
           },
 holidaycheer: { name: 'Holidaycheer',
                 recipe: {
                   time: { start: '2018-12-14', end: '2019-01-07' }, count: 759,
                   traits: ['elk', ['PU28','PU29']] }
               },
  lit:      { name: 'Lit',
              recipe: {
                time: { start: '2018-12-14', end: '2019-01-07' }, count: 1006,
                traits: ['elk', 'PU30'] }
            },

## October
  ## date: '2018-10-21' ??
  thatsawrap:  { name: 'Thatsawrap',
                 recipe: {
                   time: { start: '2018-10-20', end: '2018-11-06' }, count: 615,
                   traits: ['bobtail','WE00','PU28'] }
              },
  ## date: '2018-10-19' ??
  duckduckcat: { name: 'Duckduckcat',
                 recipe: {
                   time: { start: '2018-10-20', end: '2018-11-15' }, count: 1249,
                   traits: ['neckbeard',['PU24','PU25','PU26']] }
               },

## September
  ## date: '2018-09-19' ??
  prune:   { name: 'Prune',
             recipe: {
               time: { start: '2018-09-18', end: '2018-09-30' }, count: 921,
               traits: ['norwegianforest', TOTESBASIC, 'PU25'] }
          },
  furball:  { name: 'Furball',
              recipe: {
                time: { start: '2018-09-19', end: '2018-09-30' }, count: 998,
                traits: ['norwegianforest', TOTESBASIC, 'PU26'] }
            }
}.merge( PURRSTIGES_ROBOKITTY )
 .merge( PURRSTIGES_PIRATE )
 .merge( PURRSTIGES_ALPACAT )
 .merge( PURRSTIGES_KITTENHEIM )
 .merge( PURRSTIGES_HACKATAO )
