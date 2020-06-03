@students = []

def input_students
    name = "hold"
    while name != "" do
        x = 0
        puts "Please enter the name of the students"
        puts "To finish, just hit return twice"
        name = gets.strip
            break if name.empty?

        puts "Enter in the cohort date:"
        cohort = gets.strip.to_sym
        cohort = "n/a" if cohort.to_s == ""

        puts "Enter in the DOB"
        dob = gets.strip.to_sym
        dob = "n/a" if dob.to_s == ""
        
        
            hash = Hash.new ("default")
            hash = {name: name, cohort: cohort, dob: dob}   
            @students << hash 
        puts "Now we have #{@students.count} student" + (@students.count == 1 ? "" : "s")
    end
end


def print_header
    puts "The students of Villains Academy"
    puts "--------"
end

def print_students_list(names)
    names.sort_by! {|student| student[:cohort]}
    names.each do |student|
        puts "#{student[:name]}, #{student[:dob]} (cohort #{student[:cohort]})".center(100)
    end
end

def print_footer(names)
    puts "Overall, we have #{names.length} great student" + (names.count == 1 ? "" : "s")
end

#nothing will happen until we call the method
def interactive_menu
    loop do
        print_menu
        process(gets.chomp)
    end
  end

  def print_menu
    puts "1. Input the students"
    puts "2. Show the students"
    puts "3. Save the list ot students.csv"
    puts "9. Exit"
  end

  def show_students
    print_header
    print_students_list(@students)
    print_footer(@students)
  end

  def process(selection)
    case selection
    when "1"
        students = input_students
    when "2"
        show_students
    when "3"
        save_students
    when "9"
        exit
    else
        puts "I don't know what you meant, try again"
    end
end

def save_students
    file = File.open("students.csv", "w")
    @students.each do |student|
        student_data = [student[:name], student [:cohort]]
        csv_line = student_data.join(",")
        file.puts csv_line
    end
    file.close
end