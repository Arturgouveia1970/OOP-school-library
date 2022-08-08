def user_choice(choice)
  run = Apps.new
  loop do
    case choice
    when 1
      run.list_books
    when 2
      run.list_people
    when 3
      run.create_person
    when 4
      run.create_book
    when 5
      run.create_rental
    when 6
      run.list_rentals
    when 7
      puts 'Thank you for using the school library app'
      exit
    else
      puts ' Choose a number between 1 and 7'
    end
  end
end
