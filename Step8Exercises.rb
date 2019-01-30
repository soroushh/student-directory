# let's put all the students into an array
def input_students
  puts "Please enter the names of students."
  puts "To finish, just hit return twice"
  #create an empty array
  students = []
  # get the first name
  name = gets.chomp
  #while the name is not empty, repeat this code
  while !name.empty? do
    #add the student hash to the array
    students << {name: name , cohort: :november, country: :UK }
    puts "Now we have #{students.count} students"
    #get another name from the user
    name = gets.chomp
  end
  #return the array of students
  students
end
def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end
def print(students)
  counter = 0
  size = students.size()
  while counter < size
    puts "#{students[counter][:name]} #{students[counter][:cohort]} #{students[counter][:country]}"
    counter += 1
  end
end
def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end
students = input_students
#nothing happens until we call methods
print_header
print(students)
print_footer(students)
