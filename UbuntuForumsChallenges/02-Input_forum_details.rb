
puts "Collecting your forum details, entering quit at any prompt will exit"



def ask(question)
	puts "Please enter your #{question}"
	answer = gets.chomp
	return answer
end


class TestAnswer 
	def initialize(answer, question)
		@answer = answer
		@question = question
	end
	def put
		puts @answer
		puts @question
	end
	def checkquit
		quit = ["quit", "Quit", "QUIT"]
		if quit.include?(@answer) then
			exit
		end
	end
	def checkint
		answerint = @answer.to_i
		if answerint.to_i < 1 then
			sane = "false"
		elsif answerint > 999999 then
			sane = "false"
		else
			sane = "true"
		end
		return sane
	end
end



questions = ["name", "age", "id"]
for question in questions do
sane = "false"
	while sane == "false" do
		answer = ask(question)
	
		test = TestAnswer.new(answer, question)

		test.checkquit

		if question == "name" then
			sane = "true"
			name = answer
		elsif question == "age" then
			sane = test.checkint
			if sane == "true" then
				age = answer
			end
		else 
			sane = test.checkint
			if sane == "true" then
				id = answer
			end
		end
	end

end








puts "You are #{name}, aged #{age.to_i} next year you will be #{age.to_i + 1}, with user id #{id}, the next user is #{id.to_i + 1}."
