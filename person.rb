require_relative './nameable'

class Person < Nameable
  attr_accessor :name, :age
  attr_reader :id

  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = rand(1..10_000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    super()
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    @name
  end

  private

  def of_age?
    @age >= 18
  end
end

# person = Person.new(22, 'maximilianus')
# puts (person.correct_name)
# capitalizedPerson = CapitalizeDecorator.new(person)
# puts (capitalizedPerson.correct_name)
# capitalizedTrimmedPerson = TrimmerDecorator.new(capitalizedPerson)
# puts (capitalizedTrimmedPerson.correct_name)
