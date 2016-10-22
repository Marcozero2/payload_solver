#!usr/bin/ruby

require_relative"game"
require "test/unit"

class TestGame < Test::Unit::TestCase 

  def test_get_game()
  	ary = [[[5,1],[3,1],[5,1]], [[4,1],[2,1],[0,1]], [[4,1],[3,1],[4,1]]]
  	game = Game.new(ary)
  	assert_equal(ary, game.game)
  end

  def test_get_player()
  	ary = [[[5,1],[3,1],[5,1]], [[4,1],[2,1],[0,1]], [[4,1],[3,1],[4,1]]]
  	game = Game.new(ary)
  	assert_equal(1, game.player)
  end

  def test_switch_player()
  	ary = [[[5,1],[3,1],[5,1]], [[4,1],[2,1],[0,1]], [[4,1],[3,1],[4,1]]]
  	game = Game.new(ary)
  	game.switch_player()
  	assert_equal(2, game.player)
  end
end