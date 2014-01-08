
# accepts one variable, the hash you want to create
# method hashes each key to its value 
# then prints out all the values indexed to "~p1"
def start (q)
	lines_grabbed = ""
	key = ""

	File.open("story.txt", "r") do |infile|

	  while (line = infile.gets)
	    if line.index("~p") 
	    	key = line
	    	lines_grabbed = ""
	    else 
	    	lines_grabbed += line
	    end
	    q[key] = lines_grabbed

	  end
	end

	#p1 is a new hash consisting of entries for which the block returns true
	p1 = q.select do |key, value|
		key.index("~p1")
	end

	#prints out all of the values for all the p1
	p1.each do |k, v|
		puts v 
		File.open("out.txt", 'a') {|f| f.write(v)}
	end
end 

# accepts two variables, the hash you created and the user's choice
# method calls the result that should be printed based on the user's choice
def eggs_choice (q, choice)

	if choice == "Use Gordon Ramsey's recipe"
		print_result(q, "~p2")
	end

	if choice == "Whip up your own thing"
		print_result(q, "~p3")
	end

	if choice == "Call your friend for a recipe"
		print_result(q, "~p4")
	end

	if choice == "Not hungry at all"
		print_result(q, "~p5")
	end
end 

# accepts two variables, the hash you created and the key you want the value of
# method prints the result (the value of the selected key)
def print_result (q, p_string)
	p = q.select do |key, value|
			key.index(p_string)
		end

	p.each do |k, v|
		puts v
		File.open("out.txt", 'a') {|f| f.write(v)}
	end
end

File.open("out.txt", 'w')
pages_with_questions = {}
start(pages_with_questions)

choice = gets.chomp
File.open("out.txt", 'a') {|f| f.write("#{choice} \n")}
eggs_choice(pages_with_questions, choice)

puts "Do you want to start again"
start_over = gets.chomp
File.open("out.txt", 'a') {|f| f.write("\n #{start_over}")}

if start_over == "yes"
	start(pages_with_questions)
else
	
end

# I need to have a variable that every:
# input and output
# gets appended to
# then save it to a file


=begin  ===========================================> using if statements
choice = gets.chomp
if choice == "Use Gordon Ramsey's recipe"
	p2 = pages_with_questions.select do |key, value|
		key.index("p2")
	end

	p2.each do |k, v|
		puts v
	end
	
end

elsif choice == "Whip up your own thing"
	p3 = pages_with_questions.select do |key, value|
			key.index("p3")
	end

	p3.each do |k, v|
		puts v
	end

end

#can i have no else's and only elsif's ?
elsif choice == "Call your friend for a recipe"
	p4 = pages_with_questions.select do |key, value|
			key.index("p4")
	end

	p4.each do |k, v|
		puts v
	end
end 
=end


