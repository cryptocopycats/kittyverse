# encoding: utf-8

## std libs
require 'date'
require 'json'


## 3rd party libs
require 'base32-alphabets'


## our own code
require 'kittyverse/version'    # note: let version always go first

require 'kittyverse/config/traits'
require 'kittyverse/config/traits_timeline'
require 'kittyverse/config/fancies'
require 'kittyverse/config/purrstiges'


require 'kittyverse/mewtations'
require 'kittyverse/links'

require 'kittyverse/pages/genes'

require 'kittyverse/recipes'
require 'kittyverse/traits'
require 'kittyverse/cattributes'
require 'kittyverse/fancies'



# say hello
puts Kittyverse.banner    if defined?($RUBYCOCO_DEBUG) && $RUBYCOCO_DEBUG
