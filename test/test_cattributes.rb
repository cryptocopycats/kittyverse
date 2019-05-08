# encoding: utf-8

###
#  to run use
#     ruby -I ./lib -I ./test test/test_cattributes.rb


require 'helper'


class TestCattributes < MiniTest::Test

def test_savannah
  c = Cattribute.find_by_name( 'savannah' )
  assert_equal 'savannah', c.name
  assert_equal 'Fur',      c.type.name
  assert_equal 1,          c.traits.size

  c = Cattribute.find_by( name: 'savannah' )
  assert_equal 'savannah', c.name
  assert_equal 'Fur',      c.type.name
  assert_equal 1,          c.traits.size

  c = Cattribute[ 'savannah' ]
  assert_equal 'savannah', c.name
  assert_equal 'Fur',      c.type.name
  assert_equal 1,          c.traits.size
end

def test_totesbasic
  c = Cattribute.find_by_name( :totesbasic )
  assert_equal 'totesbasic',  c.name
  assert_equal 'Pattern',     c.type.name
  assert_equal 3,             c.traits.size

  c = Cattribute[ 'totesbasic' ]
  assert_equal 'totesbasic',  c.name
  assert_equal 'Pattern',     c.type.name
  assert_equal 3,             c.traits.size

end

def test_bionic
  c = Cattribute.find_by_name( 'bionic' )
  assert_equal 'bionic',    c.name
  assert_equal 'Purrstige', c.type.name
  assert_equal 0,           c.traits.size
  pp c.recipe

  c = Cattribute[ 'bionic' ]
  assert_equal 'bionic',    c.name
  assert_equal 'Purrstige', c.type.name
  assert_equal 0,           c.traits.size
end

end  # class TestCattributes
