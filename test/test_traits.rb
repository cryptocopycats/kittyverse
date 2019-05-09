# encoding: utf-8

###
#  to run use
#     ruby -I ./lib -I ./test test/test_traits.rb


require 'helper'


class TestTraits < MiniTest::Test


def test_savannah
  [ Traits[ 'FU00' ],
    Trait.find_by_code( 'FU00' ),
    Trait.find_by( code: 'FU00' ),
    Traits[ 'savannah' ],
    Traits[ 'Savannah' ],
    Trait.find_by_name( 'Savannah' ),
    Trait.find_by( name: 'Savannah' ),
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
  end
end

def test_fu31
  [ Traits[ :body ][ 'x' ],
    Traits[ :body ][ '31' ],
    Traits[ :body ][ 31 ]
  ].each do |t|
    assert_equal Trait,    t.class
    assert_equal nil,      t.name
    assert_equal "Fur",    t.type.name
    assert_equal "FU31",   t.code
    assert_equal "x",      t.kai
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
  end
end

def test_body
  [ Traits[ :body ],
    TraitType.find_by_key( :body ),
    TraitType.find_by( :key => :body )
  ].each do |tt|
    assert_equal TraitType, tt.class
    assert_equal "Fur",     tt.name
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
