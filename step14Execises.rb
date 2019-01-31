@students = [] #an empty array accessible to all methods.
require "CSV"
def add_a_student(name, cohort = "november")
  @students << {name: name, cohort: cohort.to_sym}
end

def input_taking
  STDIN.gets.chomp()
end

def input_students
  puts "Please enter the names of students.\nTo finish, just hit return twice"
  # get the first name
  name = input_taking
  #while the name is not empty, repeat this code
  first_size = @students.size()
  while !name.empty? do
    #add the student hash to the array
    add_a_student(name)
    puts "Now we have #{@students.count} students"
    #get another name from the user
    name = input_taking
  end
  second_size = @students.size()
  puts "#{second_size - first_size} students were added to the students list."
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
  puts "1. Input students\n2. Show the students \n3. Save the list to a chosen file\n4. Load the list from a chosen file\n9. Exit"
   # 9 because we will be adding more items
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
  puts " Please enter the name of the file you want to load the names to"
  file_name = input_taking + ".csv"
  CSV.open(file_name, "wb") do |line|
    @students.each do |student|
      line << [student[:name], student[:cohort].to_s]
    end
  end
  puts "#{@students.size()} students were added to #{file_name} file."
end

def file_name_taking_for_loading
  puts "Please enter the file name"
  return input_taking + ".csv"
end

def load_students(filename = file_name_taking_for_loading)
  first_size = @students.size
  CSV.foreach(filename) do |line|
    name , cohort = line
    @students << {name: name, cohort: cohort}
  end
  second_size = @students.size
  puts "#{second_size-first_size} students were loaded from the file."
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
    return
  elsif !File.exists?(filename)
    puts "the file does not exist."
    exit
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
