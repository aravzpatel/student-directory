def input_students
    
    students = []
    
    name = "hold"
    while name != "" do
        x = 0
        puts "Please enter the name of the students"
        puts "To finish, just hit return twice"
        name = gets.chomp
            break if name.empty?

        puts "Enter in the cohort date:"
        cohort = gets.chomp.to_sym
        cohort = "n/a" if cohort.to_s == ""

        puts "Enter in the DOB"
        dob = gets.chomp.to_sym
        dob = "n/a" if dob.to_s == ""
        
        
            hash = Hash.new ("default")
            hash = {name: name, cohort: cohort, dob: dob}   
            students << hash 
        puts "Now we have #{students.count} student" + (students.count == 1 ? "" : "s")
    end

    students
end


def print_header
    puts "The students of Villains Academy"
    puts "--------"
end

def print(names, cohort)
    names.sort_by! {|student| student[:cohort]}
    names.each do |student|
        puts "#{student[:name]}, #{student[:dob]} (cohort #{student[:cohort]})".center(100) if student[:cohort] == cohort.to_sym
    end
end

def print_footer(names)
    puts "Overall, we have #{names.length} great student" + (names.count == 1 ? "" : "s")
end

#nothing will happen until we call the method
students = input_students
print_header
print(students, "june")
print_footer(students)