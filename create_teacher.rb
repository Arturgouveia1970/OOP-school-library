require './app'
require './data/preserve_data.rb'

def create_teacher
  print 'Age: '
  age = gets.chomp

  print 'Name: '
  name = gets.chomp

  print 'Specialization: '
  specialization = gets.chomp

  teacher = Teacher.new(specialization, age, name)
  @people.push(teacher)
  save_teacher(name, age, specialization)
  puts 'teacher created successfully'
end
