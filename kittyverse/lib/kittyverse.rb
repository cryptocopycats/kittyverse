## std libs
require 'pp'
require 'date'
require 'time'
require 'json'
require 'uri'
require 'fileutils'


## 3rd party libs
require 'base32-alphabets'


## our own code
require 'kittyverse/version'    # note: let version always go first

require 'kittyverse/config/traits'
require 'kittyverse/config/traits_timeline'
require 'kittyverse/config/exclusives'
require 'kittyverse/config/special_editions'
require 'kittyverse/config/fancies'
require 'kittyverse/config/purrstiges'
require 'kittyverse/config/colors'

require 'kittyverse/mewtations'

require 'kittyverse/recipes'
require 'kittyverse/traits'
require 'kittyverse/cattributes'
require 'kittyverse/fancies'


## genes / genome
require 'kittyverse/gene'
require 'kittyverse/genome'


# say hello
puts Kittyverse.banner
