#Should print the some 99 bottles of beer on the wall to terminal
beer = 99
for i in 1..99 do
	if beer > 2 then
		puts  "#{beer} bottles of beer on the wall, #{beer}  bottles of beer."
		beer = beer - 1
		puts "Take one down and pass it around, #{beer} bottles of beer on the wall."
	elsif beer = 1 then
		puts "#{beer} bottle of beer on the wall, #{beer} bottle of beer.\nTake it down and pass it around, no more bottles of beer on the wall."
		beer = 0
	else
		puts "No more bottles of beer on the wall, no more bottles of beer.\nGo to the store and buy some more, 99 bottles of beer on the wall."
	end

end
