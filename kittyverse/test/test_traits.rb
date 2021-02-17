###
#  to run use
#     ruby -I ./lib -I ./test test/test_traits.rb


require 'helper'


class TestTraits < MiniTest::Test


def test_savannah
  [ Trait[ 'FU00' ],
    Trait.find_by_code( 'FU00' ),
    Trait.find_by( code: 'FU00' ),
    Trait[ 'savannah' ],
    Trait[ 'Savannah' ],
    Trait.find_by_name( 'Savannah' ),
    Trait.find_by( name: 'Savannah' ),
    Traits[ 'FU00' ],
    Traits[ 'savannah' ],
    Traits[ 'Savannah' ],
    Traits[ :body ][ '1' ],
    Traits[ :body ][ '00' ],
    Traits[ :body ][ 0 ],
    Traits['FU']['00'],
    Traits['FU'][0],
    Traits[:FU][0],
    Traits[:FU00],
    Traits['Fur'][0]
  ].each do |t|
    assert_equal Trait,      t.class
    assert_equal "Savannah", t.name
    assert_equal "Fur",      t.type.name
    assert_equal "FU00",     t.code
    assert_equal "1",        t.kai
    assert_equal 0,          t.num
    assert_equal "00000",    t.bin
    assert_equal "00000",    t.binary
    assert_equal 0,          t.tier
    assert_equal "",         t.tier_roman
    assert_equal "",         t.tier(:roman)
    assert                   t.base?
    assert                   t.m1? == false
    assert                   t.m2? == false
    assert                   t.m3? == false
    assert                   t.m4? == false
  end
end

def test_moonrise
  t = Trait[ 'Moonrise' ]
  assert_equal "PA30",  t.code
  assert_equal "w",     t.kai
  assert_equal 30,      t.num
  assert_equal "11110", t.bin
  assert_equal "11110", t.binary
  assert_equal 4,       t.tier
  assert_equal 4,       t.level
  assert_equal 4,       t.m
  assert_equal "IIII",  t.tier_roman
  assert_equal "IIII",  t.tier(:roman)
  assert_equal "IIII",  t.level(:roman)
  assert_equal "IIII",  t.m(:roman)
  assert                t.base? == false
  assert                t.m1? == false
  assert                t.m2? == false
  assert                t.m3? == false
  assert                t.m4?
end


def test_totesbasic
  [ Trait.find_by_name( 'totesbasic 1' ),
    Trait.find_by_name( 'totesbasic_1' ),
    Trait.find_by_name( 'totesbasic (14)' ),
    Trait.find_by_name( 'totesbasic_14' ),
    Trait.find_by_name( 'totesbasic (f)' ),
    Trait.find_by_name( 'totesbasic_f' ),
    Trait[ 'totesbasic 1' ],
    Trait[ 'totesbasic_1' ],
  ].each do |t|
    assert_equal Trait,          t.class
    assert_equal "Totesbasic 1", t.name
    assert_equal "Pattern",      t.type.name
    assert_equal "PA14",         t.code
    assert_equal "f",            t.kai
    assert_equal 14,             t.num
    assert                       t.base?
    assert_equal 0,              t.tier
    assert_equal "",             t.tier_roman
    assert_equal "",             t.tier(:roman)
  end
end


def test_fu31
  [ Traits[ :body ][ 'x' ],
    Traits[ :body ][ '31' ],
    Traits[ :body ][ 31 ]
  ].each do |t|
    assert_equal Trait,    t.class
    assert       t.name == nil
    assert_equal "Fur",    t.type.name
    assert_equal "FU31",   t.code
    assert_equal "x",      t.kai
    assert_equal 31,       t.num
    assert_equal "11111",  t.bin
    assert_equal "11111",  t.binary
    assert                 t.tier == nil
    assert                 t.level == nil
    assert                 t.m == nil
    assert_equal "",       t.tier_roman
    assert_equal "",       t.tier(:roman)
    assert_equal "",       t.level(:roman)
    assert_equal "",       t.m(:roman)
    assert                 t.base? == false
    assert                 t.m1? == false
    assert                 t.m2? == false
    assert                 t.m3? == false
    assert                 t.m4? == false
  end
end

def test_vigilante
  [ Traits['Pattern'][0],
    Traits['PA00'],
    Traits['Vigilante']
  ].each do |t|
    assert_equal Trait,       t.class
    assert_equal "Vigilante", t.name
    assert_equal "Pattern",   t.type.name
    assert_equal "PA00",      t.code
    assert_equal "1",         t.kai
    assert_equal 0,           t.num
  end
end

def test_body
  [ Traits[ :body ],
    TraitType.find_by_key( :body ),
    TraitType.find_by( :key => :body )
  ].each do |tt|
    assert_equal TraitType, tt.class
    assert_equal "Fur",     tt.name
    assert_equal :body,     tt.key
    assert_equal 32,        tt.traits.size
  end
end




def test_each
  Traits.each do |type|
    puts "#{type.key} => #{type.name} (#{type.code}), genes #{type.genes}"
  end

  Traits.each_with_index do |type,i|
    puts "#{i}: #{type.key} => #{type.name} (#{type.code}), genes #{type.genes}"
  end

  TraitType.each do |type|
    puts "#{type.key} => #{type.name} (#{type.code}), genes #{type.genes}"
  end

  TraitType.each_with_index do |type,i|
    puts "#{i}: #{type.key} => #{type.name} (#{type.code}), genes #{type.genes}"
  end
end

end # class TestTraits
