#!/usr/bin/ruby

=begin
def player1_is_strongly_dominated_all_loop(array, row):
    """
        Compares the col with each col in the array.
        Returns True if the col is dominated by another strategy.
        Returns False otherwise.
    """
    payload_compare = get_player1_payload_row(array, row)
    for i in range(row, len(array)-1): #for each row in the first row
        payload_p1 = get_player1_payload_row(array, i+1) #so go to the right most row of the given col. and the len is 3, so stop at row 2
        if compare_payload(payload_compare, payload_p1) == True:
            return True
    if row >= 1: #want to check the columns before the col
        for j in range(0, row): #for each col in the first row
            payload_p1 = get_player1_payload_row(array, j) #start at 0
            if compare_payload(payload_compare, payload_p1) == True:
                return True
    return False
=end

def player1_is_strongly_dominated_all_loop(array, row)
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
		end	 while j < row
	end
	return false
end

def player2_is_strongly_dominated(array, col)
	payload_compare = get_player2_payload_col(array, col)
	payload_p2 = get_player2_payload_col(array, col + 	1)
	if compare_payload(payload_compare, payload_p2) == true
		return true
	end
	return false
end

def player1_is_strongly_dominated(array, row)
	payload_compare = get_player1_payload_row(array, row)
	payload_p1 = get_player1_payload_row(array, row + 1)
	if compare_payload(payload_compare, payload_p1) == true
		return true
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
