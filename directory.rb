def input_students
  #list of valid cohorts as symbols
  months = [:January, :February, :March, :April, :May, :June, :July,
  :August, :September, :October, :November, :December]
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students =[]
  # get the first name
  name = gets.chomp
  puts "What cohort are they in?"
  cohort = gets.chomp.to_sym.capitalize
  while !name.empty? do
    #if statement asks if the name array has an input
    #and then if the cohort input matches out valid cohort array
    if !name.empty? && !months.include?(cohort)
      #if it doesn't we ask for another input. this checks for typos.
      #captialisation doesn't matter
      puts "Please enter a valid cohort!"
      cohort = gets.chomp.to_sym.capitalize
    else
      #if they've entered a valid cohort we add it to the array
      students << {name: name, cohort:cohort}
    if students.count == 1
      puts "Now we have #{students.count} student"
    else
      puts "Now we have #{students.count} student"
    end
    # this is how we get more than one student inputted
    name = gets.chomp
    puts "What cohort are they in?"
   cohort = gets.chomp.to_sym.capitalize
  end
  end
  #return the array of students
  students
end
def print_header
  puts "The students of Villains Academy"
  puts "------------"
end
def print(students)
  #each.with_index(n) allows us to give a numbered list that isn't hard coded.
  # (n) here allows us to dictate what number we start on rather than at 0
  students.each.with_index(1) do |student, index|
    puts "#{index}. #{student[:name]} (#{student[:cohort]} cohort)"
  end
end
def print_footer(students)
  # for 1 student we now have a singular output
  if students.count == 1
    puts "Overall, we have #{students.count} great student"
  else
    puts "Overall, we have #{students.count} great students"
  end
end
#nothing happens until we call the methods
students = input_students

print_header
print(students)
print_footer(students)
