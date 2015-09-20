#!/usr/bin/ruby

require_relative"game_port"
require "test/unit"

class TestGamePort < Test::Unit::TestCase

  def test_player1_is_strongly_dominated_all_loop
    ary = [[[5,1],[3,1],[5,1]],[[4,1],[2,1],[0,1]],[[4,1],[3,1],[4,1]]]
    assert_equal(true, player1_is_strongly_dominated_all_loop(ary, 1))
    
    ary = [[[0,1],[3,1],[5,1]],[[4,1],[2,1],[0,1]],[[4,1],[3,1],[4,1]]]
    assert_equal(false, player1_is_strongly_dominated_all_loop(ary, 1))

		ary = [[[0,1],[3,1],[5,1]],[[4,1],[2,1],[0,1]],[[-1,1],[-1,1],[-1,1]]]
    assert_equal(true, player1_is_strongly_dominated_all_loop(ary, 2))
		
		ary = [[[0,1],[3,1],[5,1]],[[4,1],[2,1],[0,1]],[[4,1],[3,1],[4,1]]]
		assert_equal(false, player1_is_strongly_dominated_all_loop(ary, 2))
  end

	def test_player2_is_strongly_dominated
		ary = [[[0,0],[-1,-3]],[[-3,-1],[1,1]]]
		assert_equal(false, player2_is_strongly_dominated(ary, 0))
		
    ary = [[[0,5],[-1,10]],[[-3,6],[1,1]]]
    assert_equal(false, player2_is_strongly_dominated(ary, 0))

    ary = [[[0,0],[-1,20]],[[-3,0],[1,20]]]
    assert_equal(true, player2_is_strongly_dominated(ary, 0))
	end

	def test_player1_is_strongly_dominated
		ary = [[[-8,0],[-6,-2]],[[-4,-1],[1,1]]]
		assert_equal(true, player1_is_strongly_dominated(ary, 0))
		
		ary = [[[8,0],[6,-2]],[[4,-1],[1,1]]]
		assert_equal(false, player1_is_strongly_dominated(ary, 0))
	end
		
		
	def test_get_player2_payload_col
		ary = [[[0,0],[-1,3]],[[-3,-1],[1,1]]]
		val = [0,-1]
		assert_equal(val, get_player2_payload_col(ary, 0))
	end
	
	def test_get_player1_payload_row 
		ary = [[[0,0],[-1,-2]],[[-4,-1],[1,1]]]
		val = [0,-1]
    assert_equal(val, get_player1_payload_row(ary, 0))
    
    val = [0,-2]
    assert_not_equal(val, get_player1_payload_row(ary, 0))
    
    ary = [[[0, 1],[2, 3],[1, 0]],[[2, 3],[1, 1],[3, 0]],[[1, 1],[5, 3],[2, 0]]]
    val = [0, 2, 1]
    assert_equal(val, get_player1_payload_row(ary, 0))
    
    val = [1, 5, 2]
    assert_equal(val, get_player1_payload_row(ary, 2))
  end
	
	def test_get_player1_payload
		ary = [[0, 0], [-1, -2]], [[-4, -1] ,[1, 1]]
		val = [0, -1, -4, 1]
		assert_equal(val, get_player1_payload(ary))
		
		ary = [[[0,1],[2,3],[1,0]], [[2,3],[1,1],[3,0]], [[1,1],[5,3],[2,0]]]
		val = [0, 2, 1, 2, 1, 3, 1, 5, 2]
		assert_equal(val, get_player1_payload(ary))
	end
	
	def test_get_player2_payload
		ary = [[0, 0], [-1, -2]], [[-4, -1] ,[1, 1]]
		val = [0, -2, -1, 1]
		assert_equal(val, get_player2_payload(ary))
		
		ary = [[[0,1],[2,3],[1,0]], [[2,3],[1,1],[3,0]], [[1,1],[5,3],[2,0]]]
		val = [1, 3, 0, 3, 1, 0, 1, 3, 0]
		assert_equal(val, get_player2_payload(ary))
	end
        
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


