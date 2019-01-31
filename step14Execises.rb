@students = [] #an empty array accessible to all methods.
def add_a_student(name, cohort = "november")
  @students << {name: name, cohort: cohort.to_sym}
end
def input_students
  puts "Please enter the names of students."
  puts "To finish, just hit return twice"
  # get the first name
  name = STDIN.gets.chomp
  #while the name is not empty, repeat this code
  while !name.empty? do
    #add the student hash to the array
    add_a_student(name)
    puts "Now we have #{@students.count} students"
    #get another name from the user
    name = STDIN.gets.chomp
  end
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

def print_menu
  puts "1. Input students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts"4. Load the list from students.csv"
  puts "9. Exit" # 9 because we will be adding more items
end

def show_students()
  print_header
  print_student_list
  print_footer
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
    load_students
  when "9"
    exit
  else
    puts "I don't know what you mean, try again"
  end
end

def save_students
  file = File.open("students.csv","w")
  @students.each do |student|
    student_data = [student[:name],student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close()
end

def load_students(filename = "students.csv")
  file = File.open(filename,"r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(",")
    add_a_student(name, cohort)
  end
  file.close
end

def interactive_menu
  loop do
    print_menu
    # 2.read the input and save it into a variable
    process(STDIN.gets.chomp)
  end
end

def try_load_students
  filename = ARGV.first
  if filename.nil?
    load_students("students.csv")
    puts "#{@students.count} students was automatically loaded from
    students.csv file."
  elsif File.exists?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else
    puts "Sorry, #{filename} doesn't exist."
    exit
  end
end
try_load_students
interactive_menu
