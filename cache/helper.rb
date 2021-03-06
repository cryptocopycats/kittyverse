require 'kittyverse'
require 'kittyverse/api'



ATTRIBUTES_DELETE = [
  'image_url',
  'image_url_cdn',
  'image_url_png',
  'image_url_kitty_items',
  'status',
  'purrs',
  'watchlist',
  'hatcher',
  'owner',
  'auction',
  'offer',
]


=begin
"image_url": "https://img.cryptokitties.co/0x06012c8cf97bead5deae237070f9587f8e7a266d/174756.png",
"image_url_cdn": "https://img.cn.cryptokitties.co/0x06012c8cf97bead5deae237070f9587f8e7a266d/174756.png",
"image_url_png": "https://img.cryptokitties.co/0x06012c8cf97bead5deae237070f9587f8e7a266d/1.png",
"status": {
    "is_ready": true,
    "is_gestating": false,
    "cooldown": 1520224207018,
    "dynamic_cooldown": 1516481055212,
    "cooldown_index": 10,
    "cooldown_end_block": 4757312,
    "pending_tx_type": null,
    "pending_tx_since": null
  },
  "purrs": {
    "count": 5,
    "is_purred": false
  },
  "watchlist": {
    "count": 0,
    "is_watchlisted": false
  },
  "hatcher": {
    "address": "0x2829f8689dc90a60b1d011af2dfb0cf859bd4c48",
    "image": "11",
    "nickname": "Mk o3o!",
    "hasDapper": false,
    "twitter_id": null,
    "twitter_image_url": null,
    "twitter_handle": null
  },
  "auction": {
  },
  "offer": {
  },
  "owner": {
    "address": "0xee3766e4f996dc0e0f8c929954eaafef3441de87",
    "hasDapper": false,
    "twitter_id": null,
    "twitter_image_url": null,
    "twitter_handle": null,
    "image": "6",
    "nickname": "Elite Cats"
  },
=end


ATTRIBUTES_DELETE_IF_NIL = [
  'kitty_type',
  'fancy_type',
  'fancy_ranking',
  'prestige_type',
  'prestige_ranking',
  'prestige_time_limit',
  'variation',
  'variation_ranking',
]


ATTRIBUTES_DELETE_IF_FALSE = [
  'is_fancy',
  'is_exclusive',
  'is_fancy',
  'is_special_edition',
  'is_prestige',
]


def convert_kitty( data )
  ## simplify kitty data hash for cache
  ##
  ATTRIBUTES_DELETE.each do |key|
     data.delete( key )
  end


  matron = data['matron']
  if data.key?( 'matron' ) && (matron.is_a?( String ) || matron.nil?)
    ## keep as is (if already in new format)
  elsif matron.empty?
    data['matron'] = nil
  else
    ## just keep id (and generation) - keep generation - why? why not?
    id         = matron['id']
    generation = matron['generation']
    data['matron'] = "#{id}@#{generation}"
  end


  sire = data['sire']
  if data.key?( 'sire' ) && (sire.is_a?( String ) || sire.nil?)
    ## keep as is (if already in new format)
  elsif sire.empty?
    data['sire'] = nil
  else
    ## just keep id (and generation) - keep generation - why? why not?
    id         = sire['id']
    generation = sire['generation']
    data['sire'] = "#{id}@#{generation}"
  end


  old_children = data['children']
  if old_children.size > 0 && old_children[0].is_a?( Hash )
    ## just keep id (and generation) - keep generation - why? why not?
    children = []
    old_children.each do |child|
      id         = child['id']
      generation = child['generation']
      children << "#{id}@#{generation}"
    end
    data['children'] = children
  end


  ATTRIBUTES_DELETE_IF_NIL.each do |key|
    data.delete( key )  if data.key?( key ) && data[ key ].nil?
  end

  ATTRIBUTES_DELETE_IF_FALSE.each do |key|
    data.delete( key )  if data.key?( key ) && data[ key ] == false
  end


  ### log if we find any kitties with items - always empty?
  if data.key?( 'items' )
    items = data['items']
    if items.size > 0
      puts "!! WARN - items found in kitty:"
      pp items
      File.open( "./dl/log.txt", 'a:utf-8' ) do |f|
        f.write "found kitty #{data['id']} with items:\n"
        f.write items.inspect
        f.write "\n"
      end
    else
      data.delete('items')
    end
  end

  ## note: for now always delete
  ##   enhanced_cattributes (do NOT care about gems and gem positions for now)
  data.delete( 'enhanced_cattributes' )  if data.key?( 'enhanced_cattributes' )


  data
end




Webget.config.sleep = 1   ## set delay / sleep to 1 sec(ond)

Kitties.debug=true

CLIENT = Kitties::V0::Client.new


KNOWN_404_NOT_FOUND = [
  130,        ## retired Chef Furry exclusive (id NOT reused?)
  (187..200).to_a,
  (223..230).to_a,
  (252..259).to_a,
  (283..302).to_a,
  (304..385).to_a,
  (387..395).to_a,
  (397..401).to_a,
  (403..500).to_a,
  (530..531).to_a,
  (533..542).to_a,
  544,
  (546..555).to_a,
  (557..569).to_a,
  (571..582).to_a,
  (584..1000).to_a,
  (1021..1029).to_a,
  1150,
  (1503..1801).to_a,
  (1813..1815).to_a,
  (1817..1824).to_a,
  (1879..2000).to_a,
  2092,
  (2785..3000).to_a
].flatten



def get_kitty( id )
  request_uri = "https://api.cryptokitties.co/kitties/#{id}"
  ## res = Webget.call( request_uri )

  ## note: do NOT cache any longer for now - why? why not?
  puts "sleep 0.5 secs..."
  sleep( 0.5 ) # half a second

  res = Webclient.get( request_uri )
  res
end



def save_kitty( id )
  if KNOWN_404_NOT_FOUND.include?( id )
    puts "!! WARN - known 404 kitty not found page; skipping request"
    return
  end


=begin
  cache_dir = "#{Webcache.root}/api.cryptokitties.co/kitties"
  ## check if exists - if yes, skip
  if File.exist?( "#{cache_dir}/#{id}.json" )
    puts "[#{id}]"
    return
  end
=end

   res = get_kitty( id )

    if res.status.ok?
      data = res.json

      ## base check that we got a kitty
      unless data['id'] == id
        puts "!! ERROR: unknow respone shape; expected kitty #{id}:"
        pp data
        exit 1
      end

      ### note: skip normies for now
      ##   only save
      ##   exclusive, fancy, prestige, etc.

      if data['kitty_type'] || data['prestige_type']

        data = convert_kitty( data )

        ## out_dir = "./dl"
        out_dir = "../../cache.kitties.json"

        path = "#{out_dir}/#{id}.json"
        File.open( path, 'w:utf-8' ) do |f|
          f.write JSON.pretty_generate( data )
        end
      end
    else
      puts "!! ERROR: HTTP #{res.status.code} #{res.status.message}:"
      File.open( "./dl/log.txt", 'a:utf-8' ) do |f|
        f.write "#{id} kitty - !! HTTP ERROR - #{res.status.code} #{res.status.message}\n"
      end
    end
end

