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

def input_students_man
    puts "Selected Option 1: Input Student Names\n"
    puts "Please add the names of the student you want"
    puts "To finish entering please press Enter twice"
    # create an empty array -- Commented out as @students has been defined
    # students =[]
    # get the first name
    name = STDIN.gets.chomp
    puts
    # while the name is not empty, repeat this code
    while !name.empty? do
      puts "What is the cohort the student is in?"
      cohort = STDIN.gets.chomp
      puts
      cohorts = ["January","March","May","June","September","November"]
      if cohort.empty?
        cohort = :no_cohort_specified
        else
          while !cohorts.include? (cohort)
            puts "There is a typo in your entry or the cohort does not exist. Please type the cohort again!"
            cohort = STDIN.gets.chomp
          end
      end
      cohort = cohort.downcase.to_sym
      # ask for the bday of the student
      # puts "What is the date of birth for the student?"
      # bday = STDIN.gets.chomp
      # # ask for the country of birth
      # puts "What is the country of birth of the student?"
      # bcountry = STDIN.gets.chomp
      # # ask for the nationality of the student
      # puts "What is the nationality of the student?"
      # national = STDIN.gets.chomp
      # # ask for the height of the student
      # puts "How tall is the student?"
      # height = STDIN.gets.chomp
      # add the student hash to the array
      students_to_array(name,cohort)
      # add the student hask to the array - complex
      # students << {name: name, cohort: :november, birthday: bday, country_birth: bcountry, nationality: national, height: height}
      if @students.count > 1
        puts "Now we have #{@students.count} students\n"
      else
        puts "Now we have #{@students.count} student\n"
      end

      # get another name from the user
      puts "What is the name of the next student?"
      puts "REMEMBER: \"Enter\" twice to exit the student input"
      name = STDIN.gets.chomp

    end

    puts "Students have been succesfully entered!!\n"
    # return the array of students -- Commented out as @students has been defined
    # students
end #def input_students_man END

# -------------------

def load_students (filename = "students.csv")
  puts "Selected Option 4: Load Students List from CSV\n"
  puts " Do you want to load from a specific file or from default?\n"
  puts "Please enter the filename you want or press ENTER for default"
  file_name_rd = STDIN.gets.chomp

    if file_name_rd.empty?
      file = File.open("students.csv","r")
      file_name_rd= "default"
    else
      while !File.exists?(file_name_rd)
          puts "Sorry, #{file_name_rd} doesn't exist."
          puts "Please type an existing file name"
          file_name_rd = STDIN.gets.chomp
        end
      file = File.open(file_name_rd,"r")
    end

  file.readlines.each do |line|
    name, cohort = line.chomp.split(",")
    students_to_array(name,cohort)
  end # file.readlines.each END
  puts
  puts "Students have been succesfully loaded from #{file_name_rd}!!"
  file.close
  puts
end # def load_students

# -------------------

def students_to_array(name,cohort)
  @students << {name: name , cohort: cohort.to_sym}
end #def students_to_array

# -------------------

def print_header
    puts
    puts "The Students of Villains Academy".center($page_width)
    puts "-----------------------\n".center($page_width)
end # def print_header END

# -------------------

def print_student_details(student,index)
  puts "#{index + 1}. #{student[:name]}".ljust($page_width/2) + "(#{student[:cohort]} cohort)".rjust($page_width/2)
end # def print_student_details

# -------------------

def print_students_list
  puts "Selected Option 2: Show Student Names\n"
  puts "Do you want to show all the students? [Y/N]"
  selection = STDIN.gets.chomp.downcase

  if selection == "y"
      @students.each_with_index do |student, index|
        print_student_details(student,index)
      end # @students.each do END

    else

      puts "What is the criterion you want to use?"
      puts "\"Length\" OR \"First Letter\" OR \"Cohort\""
      criterion = STDIN.gets.chomp.downcase
      puts
      if criterion == "first letter"

            puts "What is the first letter of the name of the students you want to print?"
            letter = STDIN.gets.chomp.downcase
            puts
            puts "The student(s) whose name starts with #{letter} are:"
            @students.each_with_index do |student, index|
                if student[:name].match (/^#{letter}/i)
                print_student_details(student,index)
                end
            end # @students.each do END

        elsif criterion == "length"

            puts "What is the max length of the name of the students you want to print?"
            length = STDIN.gets.chomp.to_i
            puts
            puts "The student(s) whose name is shorter than #{length} characters are:"
            @students.each_with_index do |student, index|
                if student[:name].length < length
                print_student_details(student,index)
                end
            end # @students.each do END

        elsif criterion == "cohort"

            puts "Which cohort of students you want?"
            cohort_crit = STDIN.gets.chomp.downcase

            cohorts = ["january","march","may","june","september","november"]
            while !cohorts.include? (cohort_crit)
              puts "There is a typo in your entry or the cohort does not exist. Please type the cohort again!"
              cohort_crit = STDIN.gets.chomp
            end # while END

            cohort_crit = cohort_crit.to_sym
            puts
            puts "The student(s) of the #{cohort_crit.to_s} cohort are:"
            @students.map.with_index do |student, index|
                if student[:cohort] == cohort_crit
                  print_student_details(student,index)
                  end
            end # .map.with_index END

        else

            puts "You have not selected any criteria. So the only info you will get is:\n"

        end # if criterion END

    end # if selection == "y" END

end # def print_students_list END

# -------------------

def print_footer
  puts
  if @students.count == 1
    puts "Overall, we have #{@students.count} great student\n"
    elsif @students.count > 1
      puts "Overall, we have #{@students.count} great students\n"
      else
      puts "WE HAVE NO REGISTERED STUDENTS\n"
  end
end # def print_footer END

# -------------------

def show_students
  print_header
  print_students_list
  print_footer
end # def show_students END

# -------------------

def save_students
  puts "Selected Option 3: Save Students List to CSV file\n"
  puts " Do you want to save to a specific file or to default?\n"
  puts "Please enter the filename you want or press ENTER for default"
  file_name_sv = STDIN.gets.chomp
  if file_name_sv.empty?
      file = File.open("students.csv","w")
      file_name_sv= "default"
  else
      file = File.open(file_name_sv,"w")
  end
  # iterate over the array of students
  @students.each do |student|
     student_data =[student[:name], student[:cohort]]
     csv_line = student_data.join (",")
     file.puts csv_line
  end # @students.each END
  puts "Students have been succesfully saved to #{file_name_sv}!!"
  file.close
end # def save_students END

# -------------------

def load_students_via_cli
  filename = ARGV.first # first argument given to command line level
    if filename.nil?
      ## here we disable the automatic loading of the file to avoid writing a separate method with no feedback
        return
      elsif File.exists?(filename)
        load_students(filename)
        puts
        puts "Loaded #{@students.count} students from #{filename}\n"
      else
        puts "Sorry #{filename} doesn't exist"
        exit # exit the program
    end #File.exists?

end # def load_students_via_cli END

# -------------------

def print_menu
  puts "What would you like to do?"
  puts "  1.  Input Student Names"
  puts "  2.  Show Students Names "
  puts "  3.  Save Students List to CSV file"
  puts "  4.  Load Students List from CSV file"
  puts "  9. Exit"
end # def print_menu END

# -------------------

def process(selection)

  case selection
    when "1"
      # students =
      input_students_man
    when "2"
      show_students
    when "3"
      save_students
    when "4"
      load_students
    when "9"
      puts "Are you sure you want to exit [Y/N]?"
      exit_var = STDIN.gets.downcase.chomp
      while exit_var != "y"
        if exit_var == "n"
          puts
          start_menu
        else
        puts "Can you type your answer in again?"
        exit_var = STDIN.gets.downcase.chomp
        end
      end
      puts
      puts "Thank you for using our database!!\n"
      puts "Good bye!!"
      exit


    else
      puts "I don't know what you want. Try again!\n"
    end #case END

end # process(selection) END


# -------------------

def start_menu
    loop do
      # 1. print the menu and ask the user what to do
        print_menu
      # 2. read the input and save it into a variable + do what the user has asked
      process(STDIN.gets.chomp)
  end # loop do END
end # def start_menu

# ===============================================
# -------------- METHODS SECTION END ------------
# ===============================================

#  If you want to manually enter students uncomment the line below and
# comment out DATA SECTION ABOVE
# students = input_students_man


  load_students_via_cli
  start_menu
