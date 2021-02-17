###
#  to run use
#     ruby -I ./lib -I ./test test/test_cattributes.rb


require 'helper'


class TestCattributes < MiniTest::Test

def test_savannah
  [ Cattribute.find_by_name( 'savannah' ),
    Cattribute.find_by( name: 'savannah' ),
    Cattribute[ 'savannah' ]
  ].each do |c|
    assert_equal 'Savannah', c.name
    assert_equal 'Fur',      c.type.name
    assert_equal 1,          c.traits.size
  end
end

def test_totesbasic
  [ Cattribute.find_by_name( :totesbasic ),
    Cattribute[ 'totesbasic' ]
  ].each do |c|
    assert_equal 'Totesbasic',  c.name
    assert_equal 'Pattern',     c.type.name
    assert_equal 3,             c.traits.size
  end
end

def test_bionic
  [ Cattribute.find_by_name( 'bionic' ),
    Cattribute[ 'bionic' ]
  ].each do |c|
    assert_equal 'Bionic',    c.name
    assert_equal 'Purrstige', c.type.name
    assert_equal 0,           c.traits.size
  end
end

end  # class TestCattributes
