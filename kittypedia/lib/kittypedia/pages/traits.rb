
class TraitsPage


def build_part( offset, length )
  buf = ""
  buf << "| Tier | Kai |"
  TraitType[offset, length].each do |tt|
    buf << " #{tt.name} (#{tt.code}) |"
  end
  buf << "\n"
  buf << "|----|----|"
  buf << "----|" * length
  buf << "\n"

  buf << "|    |    |"
  TraitType[offset, length].each do |tt|
    buf << " #{tt.genes} |"
  end
  buf << "\n"

## note: skip unknown trait 31/x for now (e.g. use 0..30 and NOT 0..31)
  (0..30).each do |i|
    kai  = Kai::ALPHABET[i]
    tier = MUTATION_TIER_ROMAN[kai]
    buf << "| #{tier} | #{kai} |"
    TraitType[offset, length].each do |tt|
      t = tt.traits[i]
      if t.name

        search_url = if TOTESBASIC.include?( t.name )
          kitties_search_url( 'totesbasic' )
        else
          kitties_search_url( t.name.downcase )
        end
        buf << "[**#{t.name}**](#{search_url}) (#{t.code})"
      else
        buf << "#{t.code}"
      end
      buf << " |"
    end
    buf << "\n"
  end
  buf << "\n\n"
end


def build
  buf = ""
  buf << "# Traits\n\n"

  ## split in three parts
  buf << build_part(  0, 3 )
  buf << build_part(  3, 3 )
  buf << build_part(  6, 3 )
  buf << build_part(  9, 3 )

  buf += <<TXT
## Mutations / Mewtations

16 Mutation Pairs (16 x 2 = 32)

```
Base      Tier I    Tier II   Tier III  Tier IIII
 (1-g)     (h-p)     (q-t)     (u,v)      (w)
          h = 1+2   q = h+i   u = q+r   w = u+v
          i = 3+4   r = j+k   v = s+t
          j = 5+6   s = m+n
          k = 7+8   t = o+p
          m = 9+a
          n = b+c
          o = d+e
          p = f+g
```

Note: It's impossible for a mutation to reach `x` e.g. `w+x = x`.


## Kai (Base32) Notation

|Kai    |Binary |Num|Kai    |Binary |Num|Kai    |Binary |Num|Kai    |Binary |Num|
|-------|-------|---|-------|-------|---|-------|-------|---|-------|-------|---|
| **1** | 00000 | 0 | **9** | 01000 | 8 | **h** | 10000 |16 | **q** | 11000 |24 |
| **2** | 00001 | 1 | **a** | 01001 | 9 | **i** | 10001 |17 | **r** | 11001 |25 |
| **3** | 00010 | 2 | **b** | 01010 | 10| **j** | 10010 |18 | **s** | 11010 |26 |
| **4** | 00011 | 3 | **c** | 01011 | 11| **k** | 10011 |19 | **t** | 11011 |27 |
| **5** | 00100 | 4 | **d** | 01100 | 12| **m** | 10100 |20 | **u** | 11100 |28 |
| **6** | 00101 | 5 | **e** | 01101 | 13| **n** | 10101 |21 | **v** | 11101 |29 |
| **7** | 00110 | 6 | **f** | 01110 | 14| **o** | 10110 |22 | **w** | 11110 |30 |
| **8** | 00111 | 7 | **g** | 01111 | 15| **p** | 10111 |23 | **x** | 11111 |31 |

Note: The digit-0 and the letter-l are NOT used in kai.

TXT


  puts buf

  buf
end ## method build


  def save( path )
    File.open( path, "w:utf-8" ) do |f|
      f.write build
    end
  end

end # class TraitsPage
