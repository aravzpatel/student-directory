def input_students
    puts "Please enter the names of the students"
    puts "To finish, just hit return twice"
    students = []
    
    name = gets.chomp

    while !name.empty? do
        students << {name: name, cohort: :november}
        puts "Now we have #{students.count} students"
        name = gets.chomp
    end

    students
end


def print_header
    puts "The students of Villains Academy"
    puts "--------"
end

def print(names, key)
    names.each_with_index do |name,index|
        if name[:name].length < key
        puts "#{index+1}. #{name[:name]} (#{name[:cohort]}) cohort)"
        end
    end
end

def print_footer(names)
    puts "Overall, we have #{names.length}  great students"
end

#nothing will happen until we call the method
students = input_students
print_header
print(students, 12)
print_footer(students)