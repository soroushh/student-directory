# let's put all the students into an array
def input_students
  puts "Please enter the names of students."
  puts "To finish, just hit return twice"
  #create an empty array
  students = []
  # get the first name
  name = gets.chop()
  #while the name is not empty, repeat this code
  while !name.empty? do
    puts "Please enter the cohort of the student."
    cohort = gets.chop()
    students << {name: name , cohort: cohort}
    if students.count == 1
      puts "Now, we have #{students.count} student."
    else
      puts "Now we have #{students.count} students"
    end
    #get another name from the user
    name = gets.chop
  end
  #return the array of students
  students
end
def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end
def print(students)
  cohort_list =[]
  students.each do |student|
    cohort_list.push(student[:cohort])
  end
  cohort_list.uniq!
  cohort_list.each do |cohort|
    puts cohort
    students.each do |student|
      if student[:cohort] == cohort
        puts student[:name]
      end
    end
  end
end
def print_footer(names)
  if names.count == 1
    puts "Overall, we have #{names.count} great student"
  else
    puts "Overall, we have #{names.count} great students"
  end
end
students = input_students
#nothing happens until we call methods
print_header
print(students)
print_footer(students)
