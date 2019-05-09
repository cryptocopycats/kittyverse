# encoding: utf-8

###
#  to run use
#     ruby -I ./lib -I ./test test/test_fancies.rb


require 'helper'


class TestFancies < MiniTest::Test


def test_bugcat
  [ Fancy.find_by( key: 'bugcat' ),
    Fancy[ :bugcat ],
    Fancy[ 'Bug Cat' ]
  ].each do |fancy|
    assert_equal 'Bug Cat',     fancy.name
    assert_equal :bugcat,       fancy.key
    assert_equal 3,             fancy.ids.size
    assert_equal [101,102,103], fancy.ids
  end
end

def test_bugcat_v2
  [ Fancy.find_by( name: 'Bug Cat V2' ),
    Fancy.find_by( name: 'BugCatV2' ),
    Fancy[ 'Bug Cat V2' ],
    Fancy[ :bugcatv2 ]
  ].each do |fancy|
    assert_equal 'Bug Cat V2',    fancy.name
    assert_equal :bugcatv2,       fancy.key
    assert_equal 20,              fancy.ids.size
    assert_equal (167..186).to_a, fancy.ids
  end
end


def test_misc
  Fancy.each do |fancy|
    p fancy.name
  end

  pp Fancy.size
  pp Fancy.exclusives.size
  pp Fancy.special_editions.size
  pp Fancy.fancies.size
end


end  # class TestFancies
