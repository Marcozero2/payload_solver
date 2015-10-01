#!/usr/bin/ruby

#to do
def iterate_array(array, player)
	col = 0
	mark_for_delete = []
	begin
	  val = player2_is_strongly_dominated(array, col)
		if val == true
		  mark_for_delete << col
		end
	col += 1
	end while col + 1 < array[0].length
end

def iterate_array2(array, player)
	row = 0
	mark_for_delete = []
	begin
		val = player1_is_strongly_dominated(array, row)
		if val == true
			mark_for_delete << row
		end
	row += 1
	end while row + 1 <= array.length
	x = array.select { |x| mark_for_delete.include?(array.index(x)) == false}
end

#to do
def finish_array(array, player)
	array = iterate_array(array, player)
	player = get_next_player_turn(player)
	array = iterate_array2(array, player)
end

def get_next_player_turn(curr_player)
	if curr_player % 2 == 0
		return 1
	else
		return 2
	end
end

def delete_row(array, row)
	del = array.delete_at(row)
	array
end

def delete_col(array, col)
  i = 0
  begin
		array[i].delete_at(col)
	  i += 1
	end while i < array.length
  array
end

def player1_is_strongly_dominated(array, row)
  payload_compare = get_player1_payload_row(array, row)
  i = row
  if row < array.length - 1
    begin
	    payload_p1 = get_player1_payload_row(array, i+1)
		  if compare_payload(payload_compare, payload_p1) == true
		    return true
		  end
		  i += 1
    end while i < array.length - 1
  end
  if row >= 1
    j = 0
	  begin
	    payload_p1 = get_player1_payload_row(array, j)
		  if compare_payload(payload_compare, payload_p1) == true
		    return true
		  end
		  j += 1
	  end while j < row
	end
return false
end

def player2_is_strongly_dominated(array, col)
  payload_compare = get_player2_payload_col(array, col)
  i = col
  if col < array.length - 1
    begin
	    payload_p2 = get_player2_payload_col(array, i + 1)
	    if compare_payload(payload_compare, payload_p2) == true
		    return true
		  end
		i += 1
	  end while i < array.length - 1
  end
  if col >= 1
    j = 0
	  begin
      payload_p2 = get_player2_payload_col(array, j)
		  if compare_payload(payload_compare, payload_p2) == true
		    return true
		  end
	    j += 1
    end while j < col
  end
  return false
end

def get_player2_payload_col(array, col)
  payload_array = []
  i = 0
  begin
    payload = array[i][col]
	  payload_p2 = payload[1]
	  payload_array << payload_p2
	  i += 1
  end while i < array.length
  payload_array
end

def get_player1_payload_row(array, row)
  payload_array = Array.new
  i = 0
  begin
    payload = array[row][i]
	  payload_p1 = payload[0]
	  payload_array << payload_p1
	  i += 1
  end while i < array.length
  payload_array
end

def get_player1_payload(array)
  payload_array = Array.new
  i = 0
  j = 0
  begin
    begin
	    payload = array[i][j]
		  payload_p1 = payload[0]
		  payload_array << payload_p1
		  j +=1
	  end while j < array[i].length
	  i += 1
	  j = 0
  end while i < array.length
  payload_array
end
        
def get_player2_payload(array)
  payload_array = Array.new
  j = 0
  i = 0
  begin
	  begin
		  payload = array[i][j]
		  payload_p2 = payload[1]
		  payload_array << payload_p2
		  j += 1
	  end while j < array[i].length
	  i += 1
	  j = 0
  end while i < array.length
  payload_array
end

def compare_payload(pay1, pay2)
  count = 0
  i = 0
  begin
    if compare_to(pay1[i], pay2[i]) == -1
	    count += 1
	  end
	  i += 1
  end while i < pay1.length
  if count >= pay1.length
    return true
  end
  return false
end

def compare_to(a, b)
  if (a > b)
    return 1
  elsif (a < b)
    return -1
  end
  return 0
end
