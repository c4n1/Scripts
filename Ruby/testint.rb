def testint(thing)
		return thing.is_a? Integer
end


test = gets.chomp
answer = testint(test)

puts answer
