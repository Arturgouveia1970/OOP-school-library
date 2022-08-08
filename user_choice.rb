require './app'
require './menu'
require './create_person'
require './create_book'

# rubocop:disable Metrics/CyclomaticComplexity
def user_choice(choice)
  case choice
  when 1
    list_books
  when 2
    list_people
  when 3
    create_person
  when 4
    create_book
  when 5
    create_rental
  when 6
    list_rentals
  when 7
    puts 'Thank you for using the school library app'
    exit
  else
    puts ' Choose a number between 1 and 7'
  end
  menu
end
# rubocop:enable Metrics/CyclomaticComplexity
