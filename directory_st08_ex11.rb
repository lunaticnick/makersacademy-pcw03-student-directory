# CHANGES ARE COMMENTED WITH CAPITALS

def input_students
    puts "Please enter the names of the students"
    puts "To finish, just hit return twice"

    # CHANGE "%"" TO ""#""
    # create an empty array

    # CHANGE {} TO []
    students = []

    # CHANGE "%" TO "#"
    # get the first name

    # REMOVE THE SPACE BETWEEN "gets" AND "chomp"
    name = gets.chomp

    # CHANGE "%" TO "#"
    # while the name is not empty, repeat this code

    # ADD "!" TO .EMPTY METHOD / CHANGE when TO while
  while !name.empty? do

        # CHANGE "%" TO "#"
        # add the student hash to the array

        # CHANGE "<" TO "<<"  / STRUCTURE CORRECTLY THE KEYS/VALUES IN HASHES
        students << {name: name, cohort: :november}

        # ADD "S" TO ARRAY "student" NAME TO CORRESPOND TO A SET ARRAY
        puts "Now we have #{students.count} students"

        # CHANGE "%" TO "#"
        # get another name from the user
        # ADD "s" TO get
        name = gets.chomp

    end

    # CHANGE "%" TO "#"
    # return the array of students

    students

end


# CHANGE "-" TO "_" TO COMPLY WITH SYNTAX RULES
def print_header
  # ADD s TO put / CHANGE ' to "
  puts "The students of my cohort at Makers Academy"

# CHANGE ` TO "
  puts "-------------"
end


def print(students)
# CHANGE "/" TO "|" TO COMPLY WITH SYNTAX RULES / ADD "S" TO ARRAY "student" NAME TO CORRESPOND TO A SET ARRAY/ MAKE THE RELEVANT CAHNGES FOR#{}
  students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end



def print_footer names
# ADD  # to {} / EXCHANGE print WITH puts
  puts "Overall, we have #{names.count} great students"
end


# CHANGE - to _
students = input_students
print_header
#CHANGE {} TO ()
print(students)
#Change [] to ()
print_footer(students)
