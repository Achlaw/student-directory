# Let's put all students into an array
=begin
students = [
	{name: "Dr. Hannibal Lecter", cohort: :november, hobby: "Eating people", cob: "United Kingdom"},
	{name: "Darth Vader", cohort: :november, hobby: "Bending spines with his mind", cob: "Tatooine"},
	{name: "Nurse Ratched", cohort: :november, hobby: "Exercising her authority", cob: "United States"},
	{name: "Michael Corleone", cohort: :november, hobby: "Volunteer work", cob: "Italy"},
	{name: "Alex DeLarge", cohort: :november, hobby: "Knitting", cob: "United Kingdom"},
	{name: "The Wicked Witch of the West", cohort: :november, hobby: "Broom riding", cob: "Oz"},
	{name: "Terminator", cohort: :november, hobby: "Stalking John Connor", cob: "United States"},
	{name: "Freddy Krueger", cohort: :november, hobby: "Giving nightmares", cob: "United States"},
	{name: "The Joker", cohort: :november,  hobby: "Practical jokes that ends up killing you", cob: "United States"},
	{name: "Joffrey Baratheon", cohort: :november, hobby: "Putting heads on pikes", cob: "Westeros"},
	{name: "Norman Bates", cohort: :november, hobby: "Bird stuffing", cod: "United States"}
]
=end
def input_students
	puts "Please enter the name of the students"
	puts "To finish, just hit return four times"
	# create an empty array
	students = []
	# get the first name
	name = gets.chomp

	puts "What is #{name}'s hobby?"
	hobby = gets.chomp
	hobby = "None" if hobby.empty?

	puts "What country does #{name} come from?"
	country = gets.chomp
	country = "Unknown" if country.empty?
	
	puts "Please enter a cohort month for #{name}"
	cohort = gets.chomp

	# while the name is not empty, repeat this code
	while !name.empty? do
		# add the student hash to the array
		students << {name: name, cohort: cohort_month(cohort).to_sym, hobby: hobby, cob: country}
		puts "Now we have #{students.count} students"
		# get another name form the user
	puts "Please enter another student or hit return four times to finish"
	name = gets.chomp

	puts "What is #{name}'s hobby?"
	hobby = gets.chomp
	hobby = "None" if hobby.empty?

	puts "What country does #{name} come from?"
	country = gets.chomp
	country = "Unknown" if country.empty?
	
	puts "Please enter a cohort month for #{name}"
	cohort = gets.chomp

	end
	# return the array of students
	students
end

def cohort_month(space)
	month = [:January, :Febuary, :March, :April, :May, :June, :July, :August, :September, :October, :November, :December,]
	space
    until month.include?(space)
    puts "Please type a month correctly eg \"January\"."
    space = gets.chomp.to_sym
  	end
  space
end


def print_header
	puts "The students of Villains Academy".center(100)
	puts "-------------".center(100)
end

def print(students)
	# Ex1 Print number before name.
	# students.each_with_index do |student, index| index += 1
	# Ex2 Prints out student name beginning with D.
	# if "#{student[:name]}".start_with?('D')
		# Ex3 Print student name shorter than 12 characters.
		# if "#{student[:name]}".length <= 12
	# Ex4 Using whlte statement to print out student list.
	index = 0
	while index < students.length
		student_data = "#{index + 1} #{students[index][:name]} (#{students[index][:cohort]} cohort) | Hobby: #{students[index][:hobby]} | Country of Birth: #{students[index][:cob]}"
		index += 1
		puts student_data.center(100)
		end
	# end
	# end
end

def print_footer(students)
	puts "Overall, we have #{students.count} great students".center(100)
end

students = input_students
# nothing happens until we call the methods
print_header
print(students)
print_footer(students)
