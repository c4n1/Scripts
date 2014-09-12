
=begin
Write a program to take a person's forum name, age, forum user id (a postive integer equal to or between 1 and 999999). The program should ask for each datum individually, and not go to the next unless the previous was valid. If there is an error, it must prompt again until it is write or the program is halted. The entry "quit" should exit the program at any question.

You are LaRoza, aged 20 next year you will be 21, with user id 266234, the next user is 266235.
=end

puts "Collecting your forum details, entering quit at any prompt will exit"

quit = ["quit", "Quit", "QUIT"]

questions = ["name", "age", "id"]
for question in questions do
	puts "Please enter your #{question}"
	# the .chomp is needed to remove the new line which gets adds
	answer = gets.chomp
		puts "You have entered your #{question} as #{answer}"
		if question == "name" then
			name = answer
		elsif question == "age" then
			if answer < 1 then
			age = answer
		else
			id = answer
		end
	end
end



def checksanity(question)
	if quit.include?(answer) then
		break
	elsif question == "name"
		sane = "true"
	else
		












puts "You are #{name}, aged #{age.to_i} next year you will be #{age.to_i + 1}, with user id #{id}, the next user is #{id.to_i + 1}."
