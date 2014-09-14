

def randomnumber
	1 +rand(99)
end

def tellme(thing)
	puts thing
end


def testentry(entry, guessthis)
	if entry > guessthis then
		tellme("Try lower")
		return "fail"
	elsif entry < guessthis then
		tellme("Try higher")
		return "fail"
	else
		tellme("Got it")
		return "win"
	end
end

def getentry
	entry = gets
end

def game(gamenumber)
	result = "fail"
	guesses = 0
	guessthis = randomnumber
	tellme("Try to guess a number between 1 & 100")
	while result == "fail" do
		entry = getentry.to_i
		result = testentry(entry, guessthis)
		guesses = guesses + 1
	end
	tellme("Well done you completed the game in #{guesses} tries you have played #{gamenumber} games")
	return 1
end

gamenumber = 1  
tryagain = "y"
while tryagain == "y"
	gamenumber = gamenumber + game(gamenumber)
	tellme("If you want to try again please enter 'y' anything else will end the game")
	tryagain = getentry.chomp
end
