# encoding: utf-8


###############################
#  cryptokitties.co links

def kitties_kitty_url( id )
  "https://www.cryptokitties.co/kitty/#{id}"
end


def kitties_search_url( q )
 "https://www.cryptokitties.co/search?include=sale,sire,other&search=#{q}"
end




def kitties_fancy_search_url( fancy )   ## todo: find a better name - why? why not?

  ## note: use (official) chinese name for search param if present
  param =  fancy.name_cn ? fancy.name_cn : fancy.key

  if fancy.special_edition?
    q = "specialedition:#{param}"    ## todo: urlescape param - why? why not?
  elsif fancy.exclusive?   ## just use fancy too - why? why not?
    q = "exclusive:#{param}"
  else  ## assume "normal/regular" fancy
    q = "fancy:#{param}"
  end

  "https://www.cryptokitties.co/search?include=sale,sire,other&search=#{q}"
end

## alias :kitties_special_search_url :kitties_fancy_search_url
def kitties_specialedition_search_url( fancy ) kitties_fancy_search_url( fancy ); end



################################
#  /media - image links

def media_fancy_pic_url( key, variant_key=nil )    ### todo: find a better name - why? why not?
  if variant_key
    "https://cryptocopycats.github.io/media/kitties/100x100/fancy-#{key}-#{variant_key}.png"
  else
    "https://cryptocopycats.github.io/media/kitties/100x100/fancy-#{key}.png"
  end
end
