# Let's put all students into an array
students = [
	{name: "Dr. Hannibal Lecter", cohort: :november},
	{name: "Darth Vader", cohort: :november},
	{name: "Nurse Ratched", cohort: :november},
	{name: "Michael Corleone", cohort: :november},
	{name: "Alex DeLarge", cohort: :november},
	{name: "The Wicked Witch of the West", cohort: :november},
	{name: "Terminator", cohort: :november},
	{name: "Freddy Krueger", cohort: :november},
	{name: "The Joker", cohort: :november},
	{name: "Joffrey Baratheon", cohort: :november},
	{name: "Norman Bates", cohort: :november}
]
=begin
def input_students
	puts "Please enter the name of the students"
	puts "To finish, just hit return twice"
	# create an empty array
	students = []
	# get the first name
	name = gets.chomp
	# while the name is not empty, repeat this code
	while !name.empty? do
		# add the student hash to the array
		students << {name: name, cohort: :november}
		puts "Now we have #{students.count} students"
		# get another name form the user
		name = gets.chomp
	end
	# return the array of students
	students
end
=end
def print_header
	puts "The students of Villains Academy"
	puts "-------------"
end

def print(students)
	# Ex1 Print number before name.
	students.each_with_index do |student, index| index += 1
	# Ex2 Prints out student name beginning with D.
	if "#{student[:name]}".start_with?('D')
		# Ex3 Print student name shorter than 12 characters/
		if "#{student[:name]}".length <= 12
		puts "#{index} #{student[:name]} (#{student[:cohort]} cohort)"
		end
	end
	end
end

def print_footer(students)
	puts "Overall, we have #{students.count} great students"
end

# students = input_students
# nothing happens until we call the methods
print_header
print(students)
print_footer(students)
