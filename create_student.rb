require './app'
require './data/preserve_data'

def create_student
  print 'Age: '
  age = gets.chomp

  print 'Does student have parent permission? [Y/N]: '
  parent_permission = gets.chomp.to_s.downcase == 'y'

  print 'Name: '
  name = gets.chomp

  student = Student.new(age, name, parent_permission: parent_permission)
  @people.push(student)
  save_student(name, age, parent_permission)
  puts 'Student created successfully'
end
