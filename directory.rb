@students = []
def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # get the first name
  name = gets.chomp
  while !name.empty? do
    @students << {name: name, cohort: :november}
    if @students.count == 1
      puts "Now we have #{@students.count} student"
    else
      puts "Now we have #{@students.count} students"
    end
    # this is how we get more than one student inputted
    name = gets.chomp
  end
  #return the array of students
  @students
end

def interactive_menu
  loop do
  print_menu
  process(gets.chomp)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit"
end

def show_students
  print_header
  print_students_list
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
    puts "I don't know what you meant, try again"
  end
end

def print_header
  puts "The students of Villains Academy"
  puts "------------"
end
def print_students_list
  #each.with_index(n) allows us to give a numbered list that isn't hard coded.
  # (n) here allows us to dictate what number we start on rather than at 0
  @students.each.with_index(1) do |student, index|
    puts "#{index}. #{student[:name]} (#{student[:cohort]} cohort)"
  end
end
def print_footer
  # for 1 student we now have a singular output
  if @students.count == 1
    puts "Overall, we have #{@students.count} great student"
  else
    puts "Overall, we have #{@students.count} great students"
  end
end

def save_students
  # open the file for writing
  file = File.open("students.csv", "w")
  # iterate over the array of save_students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def load_students
  file = File.open("students.csv", "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(",")
    @students << {name: name, cohort: cohort.to_sym}
  end
  file.close
end
interactive_menu
