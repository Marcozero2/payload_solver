#!/usr/bin/ruby

require_relative"Game"
require "test/unit"

class GameTest < Test::Unit::TestCase
  
  def test_changeplayer
    ary = [[[0,1],[2,3],[1,20]], [[2,3],[1,1],[3,20]], [[1,1],[5,3],[2,20]]]
    game = Game.new(ary)
    assert_equal(1, game.player())
    game.changePlayer()
    assert_equal(2, game.player())
    game.changePlayer()
    assert_equal(1, game.player())
    game.changePlayer()
    assert_equal(2, game.player())
  end
  
  def test_getPlayer1Payload
    ary = [[[0,1],[2,3],[1,0]], [[2,3],[1,1],[3,0]], [[1,1],[5,3],[2,0]]]
    val = [0, 2, 1, 2, 1, 3, 1, 5, 2]
    game = Game.new(ary)
    assert_equal(val, game.getPlayer1Payload())
  end
  
  def test_getPlayer2Payload
    ary = [[[0,1],[2,3],[1,0]], [[2,3],[1,1],[3,0]], [[1,1],[5,3],[2,0]]]
    val = [1, 3, 0, 3, 1, 0, 1, 3, 0]
    game = Game.new(ary)
    assert_equal(val, game.getPlayer2Payload())
  end
  
  def test_compareTo
    ary = [[[0,1],[2,3],[1,20]], [[2,3],[1,1],[3,20]], [[1,1],[5,3],[2,20]]]
    game = Game.new(ary)
    assert_equal(-2, game.compareTo(2, 4))
  end
  
  def test_lessThan
    ary = [[[0,1],[2,3],[1,20]], [[2,3],[1,1],[3,20]], [[1,1],[5,3],[2,20]]]
    game = Game.new(ary)
    assert_equal(true, game.lessThan(1,5))
    assert_equal(false, game.lessThan(2,0))
  end
  
  def test_equals
    ary = [[[0,1],[2,3],[1,20]], [[2,3],[1,1],[3,20]], [[1,1],[5,3],[2,20]]]
    game = Game.new(ary)
    assert_equal(true, game.equals(1,1))
    assert_equal(false, game.equals(2,0))
  end
  
  def test_getRowLength
    ary = [[[0,1],[2,3],[1,20]], [[2,3],[1,1],[3,20]]]
    game = Game.new(ary)
    assert_equal(2, game.getRowLength())
  end
  
  def test_getColLength
    ary = [[[0,1],[2,3],[1,20]], [[2,3],[1,1],[3,20]]]
    game = Game.new(ary)
    assert_equal(3, game.getColLength())
  end
  
  def test_iterateP1Payload
    ary = [[[0,1],[2,3],[1,20]], [[2,3],[1,1],[3,20]], [[1,1],[5,3],[2,20]]]
    val = [0, 2, 1]
    game = Game.new(ary)
    assert_equal(val, game.iterateP1Payload())
  end
  
  def test_iterateP2Payload
    ary = [[[0,1],[2,3],[1,20]], [[2,3],[1,1],[3,20]], [[1,1],[5,3],[2,20]]]
    val = [1, 3, 20]
    game = Game.new(ary)
    assert_equal(val, game.iterateP2Payload())
  end
  
end