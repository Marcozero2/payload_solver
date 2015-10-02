#!/usr/bin/ruby

def iterate_array(ary, player)
  # deletes any of the columns of player 2 that are dominated by any of the other columns of player 2
  col = 0
  mfd = []
  until col == ary[0].length do
    val = player2_is_strongly_dominated(ary, col)
    if val == true
      mfd << col
    end
    col += 1
  end
  new_ary = []
  i = 0
  until i == ary.length do
    a = ary[i].select { |item| mfd.include?(ary[i].index(item)) == false }
    new_ary << a
    i += 1
  end
  new_ary
end

def iterate_array2(ary, player)
  # deletes any of the rows of player 1 that are dominated by any of the other rows of player 1
  row = 0
  mfd = []
  until row == ary.length do
    val = player1_is_strongly_dominated(ary, row)
    if val == true
      mfd << row
    end
  row += 1
  end
  ary = ary.select { |x| mfd.include?(ary.index(x)) == false }
end

def finish_array(ary, player)
  # a test function --delete later
  ary = iterate_array(ary, player)
  player = get_next_player_turn(player)
  ary = iterate_array2(ary, player)
end

def get_next_player_turn(curr_player)
  # returns an integer representing the next player
  if curr_player % 2 == 0
    return 1
  else
    return 2
  end
end

def delete_row(ary, row)
  # removes a row in a array
  del = ary.delete_at(row)
  ary
end

def delete_col(ary, col)
  # removes a column in a array
  i = 0
  until i == ary.length do
    ary[i].delete_at(col)
    i += 1
  end
  ary
end

def player1_is_strongly_dominated(ary, row)
  # returns a boolean indicating a particular row is dominated by any of the other rows of player 1
  pay_comp = get_player1_payload_row(ary, row)
  i = row
  if row + 1 < ary.length
    until i + 1 == ary.length do
      payp1 = get_player1_payload_row(ary, i + 1)
      if compare_payload(pay_comp, payp1) == true
        return true
      end
      i += 1
    end
  end
  if row >= 1
    j = 0
    until j > row do
      payp1 = get_player1_payload_row(ary, j)
      if compare_payload(pay_comp, payp1) == true
        return true
      end
      j += 1
    end
  end
return false
end

def player2_is_strongly_dominated(ary, col)
  # returns a boolean indicating a particular column is dominated by any of the other columns of player 2
  pay_comp = get_player2_payload_col(ary, col)
  i = col
  if col + 1 < ary.length
    until i + 1 == ary.length do
      payp2 = get_player2_payload_col(ary, i + 1)
      if compare_payload(pay_comp, payp2) == true
        return true
      end
    i += 1
    end
  end
  if col >= 1
    j = 0
    begin
      payp2 = get_player2_payload_col(ary, j)
      if compare_payload(pay_comp, payp2) == true
        return true
      end
      j += 1
    end while j < col
  end
  return false
end

def get_player2_payload_col(ary, col)
  # returns an array of all the payloads of player 2 in an array for a particular column
  pay_ary = []
  i = 0
  until i == ary.length do #why not i + 1?
    pay = ary[i][col]
    payp2 = pay[1]
    pay_ary << payp2
    i += 1
  end
  pay_ary
end

def get_player1_payload_row(ary, row)
  # returns an array of all the payloads of player 1 in an array for a particular row
  pay_ary = []
  i = 0
  until i == ary.length do
    pay = ary[row][i]
    payp1 = pay[0]
    pay_ary << payp1
    i += 1
  end
  pay_ary
end

def get_player1_payload(ary)
  # returns an array of all the payloads of player 1 in an array
  pay_ary = []
  i = 0
  j = 0
  begin
    begin
      pay = ary[i][j]
      payp1 = pay[0]
      pay_ary << payp1
      j +=1
    end while j < ary[i].length
    i += 1
    j = 0
  end while i < ary.length
  pay_ary
end
        
def get_player2_payload(ary)
  # returns an array of all the payloads of player 2 in an array
  pay_ary = []
  j = 0
  i = 0
  begin
    begin
      pay = ary[i][j]
      payp2 = pay[1]
      pay_ary << payp2
      j += 1
    end while j < ary[i].length
    i += 1
    j = 0
  end while i < ary.length
  pay_ary
end

def compare_payload(pay1, pay2)
  # returns a boolean if all the corresponding values in the first array are less than the values in the second array
  count = 0
  i = 0
  until i == pay1.length do
    if compare_to(pay1[i], pay2[i]) == -1
      count += 1
    end
    i += 1
  end
  if count >= pay1.length
    return true
  end
  return false
end

def compare_to(a, b)
  # returns an integer giving the relative value of one item compared to another item
  if (a > b)
    return 1
  elsif (a < b)
    return -1
  end
  return 0
end