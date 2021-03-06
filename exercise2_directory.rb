@students = [] # an empty array accessible to all methods

def interactive_menu
	loop do
		print_menu
		process(STDIN.gets.chomp)
	end
end

def print_menu
	# 1. print the menu and ask the user what to do
	puts "1. Input the students"
	puts "2. Show the students"
	puts "3. Save the list to students.csv"
	puts "4. Load the list from students.csv"
	puts "9. Exit" # 9 because we'll be adding more items
end

def process(selection)
	case selection
	when "1"
		input_students
	when "2"
		show_students
	when "3"
		save_students
	when "4"
		load_students_input
	when "9"
		exit # this will cause the program to terminate
	else
		puts "I don't know what you mean, try again"
	end
end

def input_students
	puts "Please enter the name of the students"
	puts "To finish, just hit return twice"
	# get the first name
	name = STDIN.gets.chomp
	# while the name is not empty, repeat this code
	while !name.empty? do
		# add the student hash to the array
		@students << {name: name, cohort: :november}
		puts "Now we have #{@students.count} students"
		# get another name form the user
		name = STDIN.gets.chomp
	end
end

def show_students
	print_header
	print_student_list
	print_footer
	puts " >> Loading complete"
end

def print_header
	puts "The students of Villains Academy"
	puts "-------------"
end

def print_student_list
	@students.each do |student|
		puts "#{student[:name]} (#{student[:cohort]} cohort)"
	end
end

def print_footer
	puts "Overall, we have #{@students.count} great students"
end

def save_students
	puts "Enter file name to save as"
	puts "> "
	save_as = STDIN.gets.chomp
	# open the file for writing
	file = File.open(save_as, "w")
	# iterate over the array of students
	@students.each do |student|
		student_data = [student[:name], student[:cohort]]
		csv_line = student_data.join(",")
		file.puts csv_line
	end
	file.close
	puts " >> Save successful"
end

def load_students_input
	puts "Enter file name to open"
	filename = STDIN.gets.chomp
	if File.exists?(filename) # if it exists
		load_students(filename)
		puts "Loaded #{@students.count} from #{filename}"
	else # if it doesn't xxist
		puts "Sorry, #{filename} doesn't exist."
		exit # quit the program
end
end


def load_students(filename)
	file = File.open(filename, "r")
	file.readlines.each do |line|
	name, cohort = line.chomp.split(',')
	@students << {name: name, cohort: cohort.to_sym}
	end
	file.close
	puts " >> Loading complete"
end

def try_load_students
	#filename = ARGV.first # first argument from the command line
	filename = "students.csv" # Loads this file on startup
	#if filename.nil? # get out of the method if it isn't given
	if File.exists?(filename) # if it exists
		load_students("students.csv")
		puts "Loaded #{@students.count} from #{filename}"
	else # if it doesn't xxist
		puts "Sorry, #{filename} doesn't exist."
		exit # quit the program
	end
end

try_load_students
interactive_menu
