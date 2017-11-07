def input_students
  puts "Please add the names of the student you want"
  puts "To finish entering please press Enter twice"
  # create an empty array
  students =[]
  # get the first name
  name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    # get another name from the user
    name = gets.chomp
  end
  # return the array of students
  students
end #def input_students END


def print_header
  puts "The students of Villains Academy"
  puts "-----------------------"
end # print_header END

def print (students)
  students.each_with_index do |student, index|
    puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
  end # students.each do END
end # print (students) END

def print_footer(students)
puts "Overall, we have #{students.count} great students"
end # def print_footer END

# ===============================================
# -------------- METHODS SECTION END ------------
# ===============================================

students = input_students
print_header
print(students)
print_footer(students)
