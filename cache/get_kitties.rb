####
# use:
#  $ ruby -I ../kittyverse-api/lib -I ../kittyverse/lib get_kitties.rb

require_relative 'helper'






ids = [
 130_809,
 174_756,
 1_000_000,

 1_981_081,
 1_980_963,

 1_981_086,
 1_981_074,

 1_978_975,
 1_977_737,

 1_980_954,
 1_980_882,

 1_808_031,
 1_807_375,

 1_995_804,
 1_995_769,
 1_995_657,

 1_994_817,
 1_994_810,
 1_994_787,

 1_994_813,
 1_994_811,
 1_994_798,

 1_994_673,
 1_994_672,

 1_986_087,
 1_985_038,

 1_981_651,
 1_952_143,
 1_970_648,

]

ids = [1802,1803,1805,1806,1808,1809,1812,1816]+(1825..1828).to_a

## ids = (6_526..10_000).to_a
ids = (22_900..100_003).to_a
ids.each_with_index do |id,i|
  puts "==> kitty no. #{id} [#{i+1}/#{ids.size}]..."
  save_kitty( id )
end


if Kitties.last_response
  pp Kitties.last_response.headers
  pp Kitties.last_response.ratelimit_reset
  pp Time.now
  pp Kitties.last_response.ratelimit_limit
  pp Kitties.last_response.ratelimit_remaining
  pp Kitties.last_response.ratelimit_reset?
end

puts "bye"

