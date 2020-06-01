def input_students
    
    students = []
    
    name = "hold"
    while name != "" do
        puts "Please enter the name of the students"
        puts "To finish, just hit return twice"
        name = gets.chomp
            break if name.empty?
            
        puts "Enter in the cohort date:"
        cohort = gets.chomp

        puts "Enter in the DOB"
        dob = gets.chomp

        students << {name: name, cohort: cohort, dob: dob}
        puts "Now we have #{students.count} students"
    end

    students
end


def print_header
    puts "The students of Villains Academy"
    puts "--------"
end

def print(names)
    x = 0
    while x < names.length
        puts "#{names[x][:name]}, #{names[x][:dob]} (cohort #{names[x][:cohort]})"
        x += 1
    end
end

def print_footer(names)
    puts "Overall, we have #{names.length}  great students"
end

#nothing will happen until we call the method
students = input_students
print_header
print(students)
print_footer(students)