def interactive_menu
    students = []
    loop do
        puts "1. Input the students"
        puts "2. Show the students"
        puts "9. Exit"
        selection = gets.chomp

        case selection
        when "1"
            students = input_students
        when "2"
            print_header
            print(students)
            print_footer(students)
        when "9"
            Exit
        else
            puts "I don't know what you meant, try again"
        end
    end
  end