#!/usr/bin/ruby

def compare_payload(pay1, pay2)
	count = 0
	i = 0
	begin
		if compare_to(pay1[i], pay2[i]) == -1
			return true
		end
		i += 1
	end while i < pay1.length
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

puts compare_to(20,20)
puts compare_payload([-4,-3,-2,-2],[0,1,2,3])


