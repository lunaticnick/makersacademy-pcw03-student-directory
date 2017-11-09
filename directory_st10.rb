# ===============================================
# -------------- DATA SECTION START ------------
# ===============================================

# students = [
# {name: "Dr. Hannibal Lecter", cohort: :january},
# {name: "Darth Vader", cohort: :november},
# {name: "Nurse Ratched", cohort: :january},
# {name: "Michael Corleone", cohort: :november},
# {name: "Alex DeLarge", cohort: :may},
# {name: "The Wicked Witch of the West", cohort: :may},
# {name: "Terminator", cohort: :november},
# {name: "Freddy Krueger", cohort: :may},
# {name: "The Joker", cohort: :november},
# {name: "Joffrey Baratheon", cohort: :november},
# {name: "Norman Bates", cohort: :november}
# ]

# ===============================================
# -------------- DATA SECTION END ---------------
# ===============================================


# ===============================================
# --------- GLOBAL VARIABLES SECTION ------------
# ===============================================

$page_width = 80
@students = []  # Why we use an instance variable rather than a global one

# ===============================================
# --------- GLOBAL VARIABLES SECTION END --------
# ===============================================



# ===============================================
# -------------- METHODS SECTION START-----------
# ===============================================

def input_students
    puts "Please add the names of the student you want"
    puts "To finish entering please press Enter twice"
    # create an empty array -- Commented out as @students has been defined
    # students =[]
    # get the first name
    name = gets.chomp
    # while the name is not empty, repeat this code
    while !name.empty? do
      puts "What is the cohort the student is in?"
      cohort = gets.chomp
      cohorts = ["January","March","May","June","September","November"]
      if cohort.empty?
        cohort = :no_cohort_specified
        else
          while !cohorts.include? (cohort)
            puts "There is a typo in your entry or the cohort does not exist. Please type the cohort again!"
            cohort = gets.chomp
          end
      end
      cohort = cohort.downcase.to_sym
      # ask for the bday of the student
      # puts "What is the date of birth for the student?"
      # bday = gets.chomp
      # # ask for the country of birth
      # puts "What is the country of birth of the student?"
      # bcountry = gets.chomp
      # # ask for the nationality of the student
      # puts "What is the nationality of the student?"
      # national = gets.chomp
      # # ask for the height of the student
      # puts "How tall is the student?"
      # height = gets.chomp
      # add the student hash to the array
      @students << {name: name, cohort: cohort}
      # add the student hask to the array - complex
      # students << {name: name, cohort: :november, birthday: bday, country_birth: bcountry, nationality: national, height: height}
      if @students.count > 1
        puts "Now we have #{@students.count} students"
      else
        puts "Now we have #{@students.count} student"
      end

      # get another name from the user
      puts
      puts "What is the name of the next student?"
      puts "REMEMBER: \"Enter\" twice to exit the student input"
      name = gets.chomp

    end
    # return the array of students -- Commented out as @students has been defined
    # students
end #def input_students END

# -------------------

def print_header
    puts
    puts "The Students of Villains Academy".center($page_width)
    puts "-----------------------".center($page_width)
    puts
end # def print_header END

# -------------------

def print_students_list
  puts "Do you want to print all the students? [Y/N]"
  selection = gets.chomp.downcase

  if selection == "y"
      @students.each_with_index do |student, index|
        puts "#{index + 1}. #{student[:name]}".ljust($page_width/2) + "(#{student[:cohort]} cohort)".rjust($page_width/2)
      end # @students.each do END

    else

      puts "What is the criterion you want to use?"
      puts "\"Length\" OR \"First Letter\" OR \"Cohort\""
      criterion = gets.chomp.downcase
      puts
      if criterion == "first letter"

            puts "What is the first letter of the name of the students you want to print?"
            letter = gets.chomp.downcase
            puts
            puts "The student(s) whose name starts with #{letter} are:"
            @students.each_with_index do |student, index|
                if student[:name].match (/^#{letter}/i)
                puts "#{index + 1}. #{student[:name]}".ljust($page_width/2) + "(#{student[:cohort]} cohort)".rjust($page_width/2)
                end
            end # @students.each do END

        elsif criterion == "length"

            puts "What is the max length of the name of the students you want to print?"
            length = gets.chomp.to_i
            puts
            puts "The student(s) whose name is shorter than #{length} characters are:"
            @students.each_with_index do |student, index|
                if student[:name].length < length
                puts "#{index + 1}. #{student[:name]}".ljust($page_width/2) + "(#{student[:cohort]} cohort)".rjust($page_width/2)
                end
            end # @students.each do END

        elsif criterion == "cohort"

            puts "Which cohort of students you want?"
            cohort_crit = gets.chomp.downcase

            cohorts = ["january","march","may","june","september","november"]
            while !cohorts.include? (cohort_crit)
              puts "There is a typo in your entry or the cohort does not exist. Please type the cohort again!"
              cohort_crit = gets.chomp
            end # while END

            cohort_crit = cohort_crit.to_sym
            puts
            puts "The student(s) of the #{cohort_crit.to_s} cohort are:"
            @students.map.with_index do |student, index|
                if student[:cohort] == cohort_crit
                  puts "#{index + 1}. #{student[:name]}".ljust($page_width/2) + "(#{student[:cohort]} cohort)".rjust($page_width/2)
                  end
            end # .map.with_index END

        else

            puts "You have not selected any criteria. So the only info you will get is:"
            puts

        end # if criterion END

    end # if selection == "y" END

end # def print_students_list END

# -------------------

def print_footer
  puts
  if @students.count == 1
    puts "Overall, we have #{@students.count} great student"
    puts
    elsif @students.count > 1
      puts "Overall, we have #{@students.count} great students"
      puts
    else
      puts "WE HAVE NO REGISTERED STUDENTS"
      puts
  end
end # def print_footer END

# -------------------

def print_menu
  puts "What would you like to do?"
  puts "  1.  Input the students"
  puts "  2.  Show the students"
  puts "  9. Exit"
end # def print_menu END

# -------------------

def show_students
  print_header
  print_students_list
  print_footer
end # def show_students END

# -------------------

def process(selection)

  case selection
    when "1"
      # students =
      input_students
    when "2"
      show_students
    when "9"
      exit
    else
      puts "I don't know what you want. Try again!"
      puts
  end #case END

end # process(selection) END

# -------------------

def interactive_menu
    loop do
      # 1. print the menu and ask the user what to do
        print_menu
      # 2. read the input and save it into a variable + do what the user has asked
      process(gets.chomp)
  end # loop do END
end

# ===============================================
# -------------- METHODS SECTION END ------------
# ===============================================

#  If you want to manually enter students uncomment the line below and
# comment out DATA SECTION ABOVE
# students = input_students

# puts students
 interactive_menu
