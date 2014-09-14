
def append(data, file)
	File.open(file, 'a') { |f| f.write(data) }
end

count = 0
numb = 0
File.foreach('bhaarat.text') { |line| i = line.split(". ")
       	for x in i do
		if x[0] == 'S' || x[0] == 'H'
			numb = numb + 1
			data = numb.to_s + " " + x
			append(data, 'out.text')
		end
	end 
count = count + 1
}

if count < 23 then
	append('23. English', 'bhaarat.text')
end
