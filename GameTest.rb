#!/usr/bin/ruby

require_relative"Game"
require "test/unit"

class GameTest < Test::Unit::TestCase
  
  def test_changeplayer
    ary = [[[0,1],[2,3],[1,20]], [[2,3],[1,1],[3,20]], [[1,1],[5,3],[2,20]]]
    game = Game.new(ary)
    assert_equal(1, game.player())
    game.changePlayer
    assert_equal(2, game.player())
    game.changePlayer
    assert_equal(1, game.player())
    game.changePlayer
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
  
  def test_compareP1PayloadRow1
    ary = [[[0,1],[2,3],[1,20]], [[2,3],[1,1],[3,20]], [[1,1],[5,3],[2,20]]]
    val = [0, 2, 1]
    game = Game.new(ary)
    assert_equal(val, game.compareP1Payload(0))
  end
  
  def test_compareP1PayloadRow2
    ary = [[[0,1],[2,3],[1,20]], [[2,3],[1,1],[3,20]], [[1,1],[5,3],[2,20]]]
    val = [2, 1, 5]
    game = Game.new(ary)
    assert_equal(val, game.compareP1Payload(1))
  end
  
  def test_compareP1PayloadRow3
    ary = [[[0,1],[2,3],[1,20]], [[2,3],[1,1],[3,20]], [[1,1],[5,3],[2,20]]]
    val = [1, 3, 2]
    game = Game.new(ary)
    assert_equal(val, game.compareP1Payload(2))
  end
  
  def test_compareP2PayloadCol1
    ary = [[[0,1],[2,3],[1,20]], [[2,3],[1,1],[3,20]], [[1,1],[5,3],[2,20]]]
    val = [1, 3, 20]
    game = Game.new(ary)
    assert_equal(val, game.compareP2Payload(0))
  end
  
  def test_compareP2PayloadCol2
    ary = [[[0,1],[2,3],[1,20]], [[2,3],[1,1],[3,20]], [[1,1],[5,3],[2,20]]]
    val = [3, 1, 20]
    game = Game.new(ary)
    assert_equal(val, game.compareP2Payload(1))
  end
  
  def test_compareP2PayloadCol3
    ary = [[[0,1],[2,3],[1,20]], [[2,3],[1,1],[3,20]], [[1,1],[5,3],[2,20]]]
    val = [1, 3, 20]
    game = Game.new(ary)
    assert_equal(val, game.compareP2Payload(2))
  end
  
  def test_iterateP1Payload
    ary = [[[0,1],[2,3],[1,20]], [[2,3],[1,1],[3,20]], [[1,1],[5,3],[2,20]]]
    val = [[0, 2, 1], [2, 1, 5], [1, 3, 2]]
    game = Game.new(ary)
    assert_equal(val, game.iterateP1Payload)
  end
  
  def test_iterateP2Payload
    ary = [[[0,1],[2,3],[1,20]], [[2,3],[1,1],[3,20]], [[1,1],[5,3],[2,20]]]
    val = [[1, 3, 20], [3, 1, 20], [1, 3, 20]]
    game = Game.new(ary)
    assert_equal(val, game.iterateP2Payload)
  end
    
  def test_getMaxArrayofArrays
    ary = [[[0,1],[2,3],[1,20]], [[2,3],[1,1],[3,20]], [[1,1],[5,3],[2,20]]]
    col = [[1, 3, 20], [3, 1, 20], [1, 3, 20]]
    val = [2, 2, 2]
    game = Game.new(ary)
    assert_equal(val, game.getMaxArrayofArrays(col))
  end
  
  def test_isRowIndexDominatedRow0
    ary = [[[0,1],[2,3],[1,20]], [[2,3],[1,1],[3,20]], [[1,1],[5,3],[2,20]]]
    val = [[1, 3, 20], [3, 1, 20], [1, 3, 20]]
    game = Game.new(ary)
    assert_equal(true, game.isRowIndexDominated(0))
  end
  
  def test_isRowIndexDominatedRow1
    ary = [[[0,1],[2,3],[1,20]], [[2,3],[1,1],[3,20]], [[1,1],[5,3],[2,20]]]
    val = [[1, 3, 20], [3, 1, 20], [1, 3, 20]]
    game = Game.new(ary)
    assert_equal(true, game.isRowIndexDominated(1))
  end
  
  def test_isRowIndexDominatedRow2
    ary = [[[0,1],[2,3],[1,20]], [[2,3],[1,1],[3,20]], [[1,1],[5,3],[2,20]]]
    val = [[1, 3, 20], [3, 1, 20], [1, 3, 20]]
    game = Game.new(ary)
    assert_equal(false, game.isRowIndexDominated(2))
  end
  
  def test_isRowIndexDominatedCol0
    ary = [[[0,1],[2,3],[1,20]], [[2,3],[1,1],[3,20]], [[1,1],[5,3],[2,20]]]
    val = [[1, 3, 20], [3, 1, 20], [1, 3, 20]]
    game = Game.new(ary)
    assert_equal(true, game.isColIndexDominated(0))
  end
  
  def test_isRowIndexDominatedCol1
    ary = [[[0,1],[2,3],[1,20]], [[2,3],[1,1],[3,20]], [[1,1],[5,3],[2,20]]]
    val = [[1, 3, 20], [3, 1, 20], [1, 3, 20]]
    game = Game.new(ary)
    assert_equal(false, game.isColIndexDominated(1))
  end
  
  def test_isRowIndexDominatedCol2
    ary = [[[0,1],[2,3],[1,20]], [[2,3],[1,1],[3,20]], [[1,1],[5,3],[2,20]]]
    val = [[1, 3, 20], [3, 1, 20], [1, 3, 20]]
    game = Game.new(ary)
    assert_equal(false, game.isColIndexDominated(2))
  end
  
  def test_removeRowIndexRow0
    ary = [[[0,1],[2,3],[1,20]], [[2,3],[1,1],[3,20]], [[1,1],[5,3],[2,20]]]
    val = [[[2,3],[1,1],[3,20]], [[1,1],[5,3],[2,20]]]
    game = Game.new(ary)
    game.removeRowIndex(0)
    assert_equal(val, game.ary)
  end

  def test_removeRowIndexRow1
    ary = [[[0,1],[2,3],[1,20]], [[2,3],[1,1],[3,20]], [[1,1],[5,3],[2,20]]]
    val = [[[0,1],[2,3],[1,20]], [[1,1],[5,3],[2,20]]]
    game = Game.new(ary)
    game.removeRowIndex(1)
    assert_equal(val, game.ary)
  end
  
  def test_removeRowIndexRow2
    ary = [[[0,1],[2,3],[1,20]], [[2,3],[1,1],[3,20]], [[1,1],[5,3],[2,20]]]
    val = [[[0,1],[2,3],[1,20]], [[2,3],[1,1],[3,20]]]
    game = Game.new(ary)
    game.removeRowIndex(2)
    assert_equal(val, game.ary)
  end
  
  def test_removeColIndexCol0
    ary = [[[0,1],[2,3],[1,20]], [[2,3],[1,1],[3,20]], [[1,1],[5,3],[2,20]]]
    val = [[[2,3],[1,20]], [[1,1],[3,20]], [[5,3],[2,20]]]
    game = Game.new(ary)
    game.removeColIndex(0)
    assert_equal(val, game.ary)
  end
  
  def test_removeColIndexCol1
    ary = [[[0,1],[2,3],[1,20]], [[2,3],[1,1],[3,20]], [[1,1],[5,3],[2,20]]]
    val = [[[0,1],[1,20]], [[2,3],[3,20]], [[1,1],[2,20]]]
    game = Game.new(ary)
    game.removeColIndex(1)
    assert_equal(val, game.ary)
  end
  
  def test_removeColIndexCol2
    ary = [[[0,1],[2,3],[1,20]], [[2,3],[1,1],[3,20]], [[1,1],[5,3],[2,20]]]
    val = [[[0,1],[2,3]], [[2,3],[1,1]], [[1,1],[5,3]]]
    game = Game.new(ary)
    game.removeColIndex(2)
    assert_equal(val, game.ary)
  end
end