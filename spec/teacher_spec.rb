require './teacher'

describe Teacher do
  context 'instantiate teacher' do
    teacher = Teacher.new('Science', 44, 'TEST')

    it 'instance of teacher' do
      expect(teacher.name).to eq 'TEST'
    end

    it 'age is correct' do
      expect(teacher.age).to eq 44
    end

    it 'specialization is correct' do
      expect(teacher.specialization).to eq 'Science'
    end
  end
end