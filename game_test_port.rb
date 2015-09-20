#!/usr/bin/ruby

require_relative"game_port"
require "test/unit"

class TestGamePort < Test::Unit::TestCase
  def test_compare_to
    assert_equal(0, compare_to(10, 10))
    assert_equal(1, compare_to(20, 10))
	assert_equal(-1, compare_to(0, 10))
  end
	
  def test_compare_payload
    assert_equal(false, compare_payload([20,8,6,4,2],[9,8,7,6,5]))
	assert_equal(true, compare_payload([0,0,0,0,0],[9,8,7,6,5]))
  end		
end


