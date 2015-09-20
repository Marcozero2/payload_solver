#!/usr/bin/ruby

def get_player1_payload(array)
  payload_array = Array.new
  i = 0
  j = 0
  begin 
    begin 
	  payload = array[i][j]
	  puts "payload = #{payload}"
	  payload_p1 = payload[0]
	  payload_array << payload_p1
	  j +=1
	  puts "j= #{j}"
	end while j < array[i].length
	i += 1
	j = 0
	puts "i = #{i}"
  end while i < array.length
  payload_array
end

def compare_payload(pay1, pay2)
  count = 0
  i = 0
  begin
    puts "payload1 = #{pay1[i]}"
	puts "payload2 = #{pay2[i]}"
	if compare_to(pay1[i], pay2[i]) == -1
	  count += 1
	end
	i += 1
	puts "i = #{i}"
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

array = [[[1,3],[5,10],[11,14]],[[14,21],[5,0],[13,4]],[[6,7],[9,10],[44,1]]]
puts "array = #{array}"
puts compare_to(20,20)
puts compare_payload([10,10,10,10],[0,1,2,3])
pay = Array.new(get_player1_payload(array))
p pay


