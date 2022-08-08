require './create_student'
# create person
def create_person
  print 'do you want to create a student (1) or a teacher (2)? [input the number]:'
  option = gets.chomp
  case option
  when '1'
    create_student
  when '2'
    create_teacher
  else
    puts 'that is not valid input number'
    return
  end
  puts 'Person created successfully'
end
