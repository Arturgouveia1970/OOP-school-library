require './user_choice'
def menu
  puts 'Welcome to the School Library App!'
  puts "\n"
  puts 'Please choose an option by entering a number: '

  list = {
    '1' => 'list all books',
    '2' => 'list all people',
    '3' => 'Create a person',
    '4' => 'Create a book',
    '5' => 'Create a rental',
    '6' => 'List all rentals for a given person id',
    '7' => 'Exit'
  }

  list.each do |index, string|
    puts "#{index} - #{string}"
  end

  gets.chomp.to_i
end
