# encoding: utf-8

###
#  to run use
#     ruby -I ./lib -I ./test test/test_traits.rb


require 'helper'


class TestTraits < MiniTest::Test


def test_find

  t = Traits[ 'FU00' ]
  assert_equal Trait,      t.class
  assert_equal "savannah", t.name
  assert_equal "Fur",      t.type.name
  assert_equal "FU00",     t.code
  assert_equal "1",        t.kai

  t = Trait.find_by_code( 'FU00' )
  assert_equal Trait,      t.class
  assert_equal "savannah", t.name
  assert_equal "Fur",      t.type.name
  assert_equal "FU00",     t.code
  assert_equal "1",        t.kai


  t = Trait.find_by( code: 'FU00' )
  assert_equal Trait,      t.class
  assert_equal "savannah", t.name
  assert_equal "Fur",      t.type.name
  assert_equal "FU00",     t.code
  assert_equal "1",        t.kai


  t = Traits[ 'savannah' ]
  assert_equal Trait,      t.class
  assert_equal "savannah", t.name
  assert_equal "Fur",      t.type.name
  assert_equal "FU00",     t.code
  assert_equal "1",        t.kai

  t = Traits[ 'Savannah' ]
  assert_equal Trait,      t.class
  assert_equal "savannah", t.name
  assert_equal "Fur",      t.type.name
  assert_equal "FU00",     t.code
  assert_equal "1",        t.kai

  t = Trait.find_by_name( 'Savannah' )
  assert_equal Trait,      t.class
  assert_equal "savannah", t.name
  assert_equal "Fur",      t.type.name
  assert_equal "FU00",     t.code
  assert_equal "1",        t.kai

  t = Trait.find_by( name: 'Savannah' )
  assert_equal Trait,      t.class
  assert_equal "savannah", t.name
  assert_equal "Fur",      t.type.name
  assert_equal "FU00",     t.code
  assert_equal "1",        t.kai

  t = Traits[ :body ][ '1' ]
  assert_equal Trait,      t.class
  assert_equal "savannah", t.name
  assert_equal "Fur",      t.type.name
  assert_equal "FU00",     t.code
  assert_equal "1",        t.kai

  t = Traits[ :body ][ 'x' ]
  assert_equal Trait,    t.class
  assert_equal "body_x", t.name
  assert_equal "Fur",    t.type.name
  assert_equal "FU31",   t.code
  assert_equal "x",      t.kai

  t = Traits[ :body ][ '00' ]
  assert_equal Trait,      t.class
  assert_equal "savannah", t.name
  assert_equal "Fur",      t.type.name
  assert_equal "FU00",     t.code
  assert_equal "1",        t.kai

  t = Traits[ :body ][ '31' ]
  assert_equal Trait,    t.class
  assert_equal "body_x", t.name
  assert_equal "Fur",    t.type.name
  assert_equal "FU31",   t.code
  assert_equal "x",      t.kai

  t = Traits[ :body ][ 0 ]
  assert_equal Trait,      t.class
  assert_equal "savannah", t.name
  assert_equal "Fur",      t.type.name
  assert_equal "FU00",     t.code
  assert_equal "1",        t.kai

  t = Traits[ :body ][ 31 ]
  assert_equal Trait,    t.class
  assert_equal "body_x", t.name
  assert_equal "Fur",    t.type.name
  assert_equal "FU31",   t.code
  assert_equal "x",      t.kai


  t =  Traits[ :body ]
  assert_equal TraitType, t.class
  assert_equal "Fur",     t.name

  t =  TraitType.find_by_key( :body )
  assert_equal TraitType, t.class
  assert_equal "Fur",     t.name

  t =  TraitType.find_by( :key => :body )
  assert_equal TraitType, t.class
  assert_equal "Fur",     t.name


  t = Traits['FU']['00']
  assert_equal Trait,      t.class
  assert_equal "savannah", t.name
  assert_equal "Fur",      t.type.name
  assert_equal "FU00",     t.code
  assert_equal "1",        t.kai

  t = Traits['FU'][0]
  assert_equal Trait,      t.class
  assert_equal "savannah", t.name
  assert_equal "Fur",      t.type.name
  assert_equal "FU00",     t.code
  assert_equal "1",        t.kai

  t = Traits[:FU][0]
  assert_equal Trait,      t.class
  assert_equal "savannah", t.name
  assert_equal "Fur",      t.type.name
  assert_equal "FU00",     t.code
  assert_equal "1",        t.kai

  t = Traits[:FU00]
  assert_equal Trait,      t.class
  assert_equal "savannah", t.name
  assert_equal "Fur",      t.type.name
  assert_equal "FU00",     t.code
  assert_equal "1",        t.kai

  t = Traits['Fur'][0]
  assert_equal Trait,      t.class
  assert_equal "savannah", t.name
  assert_equal "Fur",      t.type.name
  assert_equal "FU00",     t.code
  assert_equal "1",        t.kai

  t = Traits['Pattern'][0]
  assert_equal Trait,       t.class
  assert_equal "vigilante", t.name
  assert_equal "Pattern",   t.type.name
  assert_equal "PA00",      t.code
  assert_equal "1",         t.kai

  t = Traits['PA00']
  assert_equal Trait,       t.class
  assert_equal "vigilante", t.name
  assert_equal "Pattern",   t.type.name
  assert_equal "PA00",      t.code
  assert_equal "1",         t.kai

  t = Traits['Vigilante']
  assert_equal Trait,       t.class
  assert_equal "vigilante", t.name
  assert_equal "Pattern",   t.type.name
  assert_equal "PA00",      t.code
  assert_equal "1",         t.kai
end


def test_each
  TraitType.each do |type|
    puts "#{type.key} => #{type.name} (#{type.code}), genes #{type.genes}"
  end

  Traits.each do |type|
    puts "#{type.key} => #{type.name} (#{type.code}), genes #{type.genes}"
  end

  TraitType.each_with_index do |type,i|
    puts "#{i}: #{type.key} => #{type.name} (#{type.code}), genes #{type.genes}"
  end

  Traits.each_with_index do |type,i|
    puts "#{i}: #{type.key} => #{type.name} (#{type.code}), genes #{type.genes}"
  end
end

end # class TestTraits
