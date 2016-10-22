#!/usr/bin/ruby

require_relative"game_port"
require "test/unit"

class TestGamePort < Test::Unit::TestCase 

	def test_iterate_array
		ary = [[[0,1],[2,3],[1,20]], [[2,3],[1,1],[3,20]], [[1,1],[5,3],[2,20]]]
		val = [[[1,20]], [[3,20]], [[2,20]]]
    assert_equal(val , iterate_array(ary, 2))
	end
	
  def test_iterate_array_2_by_2_array
		ary = [[[0,1],[2,3]],[[2,3],[3,1]]]
		val = [[[2,3],[3,1]]]
    assert_equal(val, iterate_array2(ary, 1))
	end
	
	def test_iterate_array2_3_by_3_array
		ary = [[[0,1],[2,3],[1,20]], [[2,3],[1,1],[3,20]], [[1,1],[5,3],[2,20]]]
		val = [[[2,3],[1,1],[3,20]], [[1,1],[5,3],[2,20]]]
    assert_equal(val , iterate_array2(ary, 1))
	end
	
	def test_iterate_array2_3_by_3_fail
		ary = [[[0,1],[2,3],[1,20]], [[2,3],[1,1],[3,20]], [[1,1],[5,3],[2,20]]]
		val = [[[0,1],[2,3],[1,20]], [[2,3],[1,1],[3,20]]]
    assert_not_equal(val , iterate_array2(ary, 1))
	end
	
=begin
	def test_iterate_array_fail
		ary = [[[0,1],[2,3],[1,20]], [[2,3],[1,1],[3,20]], [[1,1],[5,3],[2,20]]]
		val = [[[0,1],[2,3]], [[2,3],[1,1]], [[1,1],[5,3]]]
    assert_not_equal(val , iterate_array(ary, 2))
	end
=end

	def test_get_next_player_turn_curr_player_1
		assert_equal(2, get_next_player_turn(1))
	end

	def test_get_next_player_turn_curr_player_2
		assert_equal(1, get_next_player_turn(2))
	end

	def test_delete_row_2_by_2_array_row_0
		ary = [[[1,2], [3,4]], [[5,6], [7,8]]]
		val = [[[5,6], [7,8]]]
		assert_equal(val, delete_row(ary, 0))
  end		

	def test_delete_row_2_by_2_array_row_1
	  ary = [[[0,1],[2,3]], [[2,3],[1,1]]]
		val = [[[0,1], [2,3]]]
		assert_equal(val, delete_row(ary, 1))
  end

  def test_delete_row_3_by_3_array_row_0
		ary = [[[0,1],[2,3],[1,0]], [[2,3],[1,1],[3,0]], [[1,1],[5,3],[2,0]]]
		val = [[[2,3],[1,1],[3,0]], [[1,1],[5,3],[2,0]]]
		assert_equal(val, delete_row(ary, 0))
	end

	def test_delete_row_3_by_3_array_row_1
		ary = [[[0,1],[2,3],[1,0]], [[2,3],[1,1],[3,0]], [[1,1],[5,3],[2,0]]]
		val = [[[0,1],[2,3],[1,0]], [[1,1],[5,3],[2,0]]]
		assert_equal(val, delete_row(ary, 1))
  end
  
  def test_delete_row_3_by_3_array_row_2
		ary = [[[0,1],[2,3],[1,0]], [[2,3],[1,1],[3,0]], [[1,1],[5,3],[2,0]]]
		val = [[[0,1],[2,3],[1,0]], [[2,3],[1,1],[3,0]]]
		assert_equal(val, delete_row(ary, 2))
  end
  
  def test_delete_col_2_by_2_array_col_0
		ary = [[[0,1],[2,3]], [[2,3],[1,1]]]
		val = [[[2,3]], [[1,1]]]
		assert_equal(val, delete_col(ary, 0))
  end	

  def test_delete_col_2_by_2_array_col_0_fail
		ary = [[[0,1],[2,3]], [[2,3],[1,1]]]
		val = [[[2,3]], [[1,10]]]
		assert_not_equal(val, delete_col(ary, 0))
  end	
  		
	def test_delete_col_2_by_2_array_col_1
		ary = [[[0,1],[2,3]], [[2,3],[1,1]]]
		val = [[[0,1]], [[2,3]]]
		assert_equal(val, delete_col(ary, 1))
  end	

  def test_delete_col_2_by_2_array_col_1_fail
		ary = [[[0,1],[2,3]], [[2,3],[1,1]]]
		val = [[[0,1]], [[2,10]]]
		assert_not_equal(val, delete_col(ary, 1))
  end		
  
  def test_delete_col_3_by_3_array_col_0
		ary = [[[0,1],[2,3],[1,0]], [[2,3],[1,1],[3,0]], [[1,1],[5,3],[2,0]]]
		val = [[[2,3],[1,0]], [[1,1],[3,0]], [[5,3],[2,0]]]
		assert_equal(val, delete_col(ary, 0))
  end	
  
  def test_delete_col_3_by_3_array_col_1
		ary = [[[0,1],[2,3],[1,0]], [[2,3],[1,1],[3,0]], [[1,1],[5,3],[2,0]]]
		val = [[[0,1],[1,0]], [[2,3],[3,0]], [[1,1], [2,0]]]
		assert_equal(val, delete_col(ary, 1))
  end	
  
	def test_delete_col_3_by_3_array_col_1_fail
		ary = [[[0,1],[2,3],[1,0]], [[2,3],[1,1],[3,0]], [[1,1],[5,3],[2,0]]]
		val = [[[0,1],[1,1]], [[2,3],[3,0]], [[1,1], [2,0]]]
		assert_not_equal(val, delete_col(ary, 1))
  end		
  
  def test_delete_col_3_by_3_array_col_2
		ary = [[[0,1],[2,3],[1,0]], [[2,3],[1,1],[3,0]], [[1,1],[5,3],[2,0]]]
		val = [[[0,1],[2,3]], [[2,3],[1,1]], [[1,1],[5,3]]]
		assert_equal(val, delete_col(ary, 2))
  end				
  
  def test_delete_col_3_by_3_array_col_2_fail
		ary = [[[0,1],[2,3],[1,0]], [[2,3],[1,1],[3,0]], [[1,1],[5,3],[2,0]]]
		val = [[[0,1],[2,3]], [[2,3],[1,2]], [[1,1],[5,3]]]
		assert_not_equal(val, delete_col(ary, 2))
  end	
  
  def test_player2_is_strongly_dominated_3_by_3_array_col_0_fail
		ary = [[[0,1],[2,3],[1,0]], [[2,3],[1,1],[3,0]], [[1,1],[5,3],[2,0]]]
		assert_not_equal(true, player2_is_strongly_dominated(ary, 0))
	end
	
	def test_player2_is_strongly_dominated_3_by_3_array_col_0
		ary = [[[0,1],[2,3],[1,20]], [[2,3],[1,1],[3,20]], [[1,1],[5,3],[2,20]]]
    assert_equal(true, player2_is_strongly_dominated(ary, 0))
  end

  def test_player1_is_strongly_dominated_3_by_3_array_col_1
    
    assert_equal(true, player1_is_strongly_dominated(ary, 1))
  end 
   
  def test_player1_is_strongly_dominated_3_by_3_array_col_1_fail
		ary = [[[0,1],[3,1],[5,1]], [[4,1],[2,1],[0,1]], [[4,1],[3,1],[4,1]]]
		assert_not_equal(true, player1_is_strongly_dominated(ary, 1))
	end
	
	def test_player1_is_strongly_dominated_3_by_3_array_col_2
		ary = [[[0,1],[3,1],[5,1]], [[4,1],[2,1],[0,1]], [[-1,1],[-1,1],[-1,1]]]
    assert_equal(true, player1_is_strongly_dominated(ary, 2))
  end
	
	def test_player1_is_strongly_dominated_3_by_3_array_col_2_fail
		ary = [[[0,1],[3,1],[5,1]], [[4,1],[2,1],[0,1]], [[4,1],[3,1],[4,1]]]
		assert_not_equal(true, player1_is_strongly_dominated(ary, 2))
  end
  
	def test_get_player2_payload_col_2_by_2_array_col_0
		ary = [[[0,0],[-1,3]], [[-3,-1],[1,1]]]
		val = [0,-1]
		assert_equal(val, get_player2_payload_col(ary, 0))
	end
	
	def test_get_player1_payload_row_2_by_2_array_col_0
		ary = [[[0,0],[-1,-2]], [[-4,-1],[1,1]]]
		val = [0,-1]
    assert_equal(val, get_player1_payload_row(ary, 0))
	end
  
  def test_get_player1_payload_row_2_by_2_array_col_0_fail
		ary = [[[0,0],[-1,-2]], [[-4,-1],[1,1]]]
    val = [0,-2]
    assert_not_equal(val, get_player1_payload_row(ary, 0))
  end
   
  def test_get_player1_payload_row_3_by_3_array_col_0
    ary = [[[0,1], [2,3],[1,0]], [[2,3],[1,1],[3,0]], [[1,1],[5,3],[2,0]]]
    val = [0, 2, 1]
    assert_equal(val, get_player1_payload_row(ary, 0))
  end
   
  def test_get_player1_payload_row_3_by_3_array_col_2
		ary = [[[0,1],[2,3],[1,0]], [[2,3],[1,1],[3,0]], [[1,1],[5,3],[2,0]]]
    val = [1, 5, 2]
    assert_equal(val, get_player1_payload_row(ary, 2))
  end
	
	def test_get_player1_payload_2_by_2_array
		ary = [[0,0], [-1,-2]], [[-4,-1] ,[1,1]]
		val = [0, -1, -4, 1]
		assert_equal(val, get_player1_payload(ary))
	end

	def test_get_player1_payload_3_by_3_array
		ary = [[[0,1],[2,3],[1,0]], [[2,3],[1,1],[3,0]], [[1,1],[5,3],[2,0]]]
		val = [0, 2, 1, 2, 1, 3, 1, 5, 2]
		assert_equal(val, get_player1_payload(ary))
	end
	
	def test_get_player2_payload_2_by_2_array
		ary = [[0,0], [-1,-2]], [[-4,-1] ,[1,1]]
		val = [0, -2, -1, 1]
		assert_equal(val, get_player2_payload(ary))
	end
		
	def test_get_player2_payload_3_by_3_array
		ary = [[[0,1],[2,3],[1,0]], [[2,3],[1,1],[3,0]], [[1,1],[5,3],[2,0]]]
		val = [1, 3, 0, 3, 1, 0, 1, 3, 0]
		assert_equal(val, get_player2_payload(ary))
	end
        
  def test_compare_to_equal
		assert_equal(0, compare_to(10, 10))
	end
	
	def test_compare_to_greater_than
    assert_equal(1, compare_to(20, 10))
  end
  
  def test_compare_to_less_than
		assert_equal(-1, compare_to(0, 10))
  end
	
  def test_compare_payload_false_fail
    assert_not_equal(true, compare_payload([20, 8, 6, 4, 2], [9, 8, 7, 6, 5]))
  end
  
  def test_compare_payload_true
    assert_equal(true, compare_payload([0, 0 ,0, 0, 0], [9, 8, 7, 6, 5]))
  end
 
=begin
  def test_compare_payload_true_empty
	  assert_equal(true, compare_payload([], []))
  end
  
  def test_compare_payload_true_nil
	  assert_equal(true, compare_payload(nil, nil))
  end
  
  def test_compare_payload_true_list_nil
	  assert_equal(true, compare_payload([nil], [nil]))
  end
  
    def test_compare_to_nil
    assert_equal(-1, compare_to(nil, nil))
  end
=end
end
