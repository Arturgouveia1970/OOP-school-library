require_relative '../book'
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
