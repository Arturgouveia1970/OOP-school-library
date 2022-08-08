# include files
require_relative './person'
require_relative './book'
require_relative './teacher'
require_relative './student'
require_relative './rental'
require 'date'
require './menu'

# app class
class Apps
  attr_accessor :books, :rentals, :people

  def initialize
    @books = []
    @rentals = []
    @people = []
  end

  def greet
    puts 'Welcome to the School Library App!'
    puts "\n"
    menu
  end

  # list all books
  def list_books
    if @books.empty?
      puts 'No book added yet.'
      return
    end
    @books.map do |book|
      puts "Title: \"#{book.title}\", Author: \"#{book.author}"
    end
  end

  # list all people
  def list_people
    if @people.empty?
      puts 'No person recorded yet.'
      return
    end
    @people.map do |person|
      puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
  end

  # create book
  def create_book
    print 'Title: '
    title = gets.chomp

    print 'Author: '
    author = gets.chomp

    book = Book.new(title, author)
    @books.push(book)

    puts 'Book created successfully'
  end

  # create rental
  def create_rental
    if @books.size.zero?
      puts 'No books available'
    elsif @people.size.zero?
      puts 'No person available'
    else
      puts 'Select a book from the following list by number: '
      @books.each_with_index { |book, index| puts "#{index}) Book Title: #{book.title}, Author: #{book.author}" }
      rental_book = gets.chomp.to_i
      puts 'Select a person from the following list by number (not id)'
      @people.each_with_index do |person, index|
        puts "#{index}) Name: #{person.name} Age: #{person.age} Id: #{person.id}"
      end
      rental_person = gets.chomp.to_i
      puts 'Enter date in format YYYY-MM-DD'
      date = convert_date(gets)
      rental_detail = Rental.new(@people[rental_person], @books[rental_book], date)
      @rentals.push(rental_detail)
      puts 'Rental successfully created'
    end
  end

  # list of rentals for a given person id
  def list_rentals
    puts 'Select id of any person'
    @people.each { |i| puts "id: #{i.id}, Person: #{i.name}" }
    print 'Person id: '
    person_id = gets.chomp
    @rentals.each do |i|
      puts "Date: #{i.date}, Book: '#{i.book.title}' by #{i.book.author}" if i.person.id.to_i == person_id.to_i
    end
  end

  # convert date
  def convert_date(str)
    Date.parse(str)
  end
end
