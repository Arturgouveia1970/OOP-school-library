require_relative '../book'
require_relative '../person'
require_relative '../student'
require_relative '../teacher'
require 'json'

def load_books
  if File.exist?('./data/books.json')
    file = File.open('./data/books.json')

    if file.size.zero?
      'Please add some books first if this is your fist time using our app'
    else
      books = JSON.parse(File.read('./data/books.json'))

      books.each do |book|
        book = Book.new(book['title'], book['author'])
        @books << book
      end
    end
    file.close
  else
    puts 'Please add some books first'
  end
  puts 'Available books:'
  @books.each { |b| puts "Book title: #{b.title}, Author: #{b.author}" } unless @books.empty?
end

def save_book(title, author)
  obj = {
    title: title,
    author: author
  }

  if File.exist?('./data/books.json')
    file = File.open('./data/books.json')

    if file.size.zero?
      book = [obj]
    else
      book = JSON.parse(File.read('./data/books.json'))
      book << obj
    end

    file.close

    myfile = File.open('./data/books.json', 'w')
    myfile.write(JSON.pretty_generate(book))
    myfile.close
  end
end

def load_people
  if File.exist?('./data/people.json')
    file = File.open('./data/people.json')
  
      if File.empty?('./data/people.json')
        puts 'Please add people data if this is your first time visiting our app'
      else
      people = JSON.parse(File.read('./data/people.json'))
      # p people.length()
      people.each do |person|
        # p person
        if person['option'] == 'Student'
          student = Student.new(person['age'], person['name'])
          @people << student
        else
          teacher = Teacher.new(person['specialization'], person['age'], person['name'])
          @people << teacher
        end
      end
    end
    file.close
  else
    puts 'Please insert some data'
  end
  puts 'Available people: '
  @people.each { |p| puts "Name: #{p.name}, Age: #{p.age}" } unless @people.empty?
end

def save_student(name, age, parent_permission)
  obj = {
    type: 'Student',
    name: name,
    age: age,
    parent_permission: parent_permission
  }

  if File.exist?('./data/people.json')
    file = File.open('./data/people.json')

    if file.size.zero?
      student = [obj]
    else
      student = JSON.parse(File.read('./data/people.json'))
      student << obj
    end

    file.close

    myfile = File.open('./data/people.json', 'w')
    myfile.write(JSON.pretty_generate(student))
    myfile.close
  end
end

def save_teacher(name, age, specialization)
  obj = {
    type: 'Teacher',
    specialization: specialization,
    name: name,
    age: age,
    parent_permission: true
  }

  if File.exist?('./data/people.json')
    file = File.open('./data/people.json')

    if file.size.zero?
      teacher = [obj]
    else
      teacher = JSON.parse(File.read('./data/people.json'))
      teacher << obj
    end

    file.close

    myfile = File.open('./data/people.json', 'w')
    myfile.write(JSON.pretty_generate(teacher))
    myfile.close
  end
end
