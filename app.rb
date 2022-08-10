# include files
require_relative './person'
require_relative './book'
require_relative './teacher'
require_relative './student'
require_relative './rental'
require_relative './create_person'
require_relative './create_student'
require_relative './create_teacher'
require 'date'
require './menu'
require_relative './data/preserve_data'
require 'pry'

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

  def load_data
    load_people
    puts
    load_books
    puts
    load_rentals
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
  binding.pry
end
