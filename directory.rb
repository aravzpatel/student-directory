@students = []
@options_hash = {
    "1" => [:input_students, "1. Input the students", "You are inputting students"],
    "2" => [:show_students, "2. Show the students", "Here are the students:"],
    "3" => [:save_students, "3. Save the list of #{$filename}", "Your list has been saved"],
    "4" => [:load_students, "4. Load the list from #{$filename}", "The list has been loaded"],
    "9" => [:exit, "9. exit", "Good bye"]
}

#nothing will happen until we call the method
def interactive_menu
    loop do
        print_menu
        process(STDIN.gets.chomp)
    end
end

def print_menu
    @options_hash.each do |key, option|
        puts option[1].center(75)
    end
end

def process(selection)
    puts @options_hash[selection][2]
    @options_hash[selection][0] == nil ? interactive_menu : send(@options_hash[selection][0])
end

def request_inputs(string)
    puts string
    variable = STDIN.gets.chomp
    return variable
end

def input_students
    # request_inputs("Please enter the name of the students. To finish, hit return twice")
    # name = STDIN.print
    # puts name
    name = ""
    while name != "quit" do
        puts "Please enter the name of the students"
        puts "To finish, enter quit"
        name = STDIN.gets.strip
            return if name == "quit"

        puts "Enter in the cohort date:"
        cohort = STDIN.gets.strip.to_sym
        cohort = "n/a" if cohort.to_s == ""

        #puts "Enter in the DOB"
        #dob = STDIN.gets.strip.to_sym
        #dob = "n/a" if dob.to_s == ""
            create_students(name, cohort)
        print_student_count(@students)
    end
end

def create_students(name, cohort)
    @students << {name: name, cohort: cohort.to_sym}
end

def show_students
    print_header
    print_students_list(@students)
    print_student_count(@students)
end

def save_students
    file = File.open("students.csv", "w")
    @students.each do |student|
        student_data = [student[:name], student[:cohort]]
        csv_line = student_data.join(",")
        file.puts csv_line
    end
    file.close
end

def print_header
    puts "The students of Villains Academy"
    puts "--------"
end

def print_students_list(names)
    # puts "which cohort do you want to see?"
    # choice = STDIN.gets.chomp
    # names.sort_by! {|student| student[:cohort]}
    names.map do |student|
        puts "#{student[:name]}, #{student[:dob]} (cohort #{student[:cohort]})".center(75) #if student[:cohort] == choice
    end
end

def print_student_count(names)
    puts "Overall, we have #{names.length} student" + (names.count == 1 ? "" : "s")
end

def load_students(filename = "students.csv")
    file = File.open(filename, "r")
    file.readlines.each do |line|
    name, cohort = line.chomp.split(',')
    create_students(name, cohort)
    end
    file.close
end

def try_load_students
    $filename = ARGV.first# first argument from the command line
    if $filename.nil? # get out of the method if it isn't given
        $filename = "students.csv"
    end
    if File.exists?($filename) # if it exists
      load_students($filename)
       puts "Loaded #{@students.count} from #{$filename}"
    else # if it doesn't exist
      puts "Sorry, #{$filename} doesn't exist."
      exit # quit the program
    end
end

try_load_students
interactive_menu