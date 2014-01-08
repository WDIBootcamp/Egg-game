
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
		key.include?("~p1")
	end

	#prints out all of the values for all the p1
	i=1 #the choice number that will be added to the start of each option

	p1.each do |k, v|
		if k.include?("c")
			puts "#{i}: #{v}"
			File.open("out.txt", 'a') {|f| f.write("#{i}: #{v}")}
			i+=1
		else
			puts v
			File.open("out.txt", 'a') {|f| f.write(v)}
		end
		
	end

end 

# accepts two variables, the hash you created and the user's choice
# method calls the result that should be printed based on the user's choice
def user_choice (q, choice)

	if choice == "1"
		print_result(q, "~p2")
	end

	if choice == "2"
		print_result(q, "~p3")
	end

	if choice == "3"
		print_result(q, "~p4")
	end

	if choice == "4"
		print_result(q, "~p5")
	end
end 

# accepts two variables, the hash you created and the key you want the value of
# method prints the result (the value of the selected key)
def print_result (q, p_string)
	p = q.select do |key, value|
			key.include?(p_string)
		end

	p.each do |k, v|
		puts v
		File.open("out.txt", 'a') {|f| f.write(v)}
	end
end


start_over = true

while start_over
	#open a file which will save the entire user's story
	File.open("out.txt", 'w')

	pages_with_questions = {}
	start(pages_with_questions)

	choice = gets.chomp
	File.open("out.txt", 'a') {|f| f.write("#{choice} \n")}
	user_choice(pages_with_questions, choice)

	puts "Do you want to start again ( yes / no )"
	start_over_answer = gets.chomp
	File.open("out.txt", 'a') {|f| f.write("\n #{start_over}")}

	if start_over_answer == "no"
		start_over = false
	end
end




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


