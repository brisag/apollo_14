require 'rails_helper'

describe Astronaut, type: :model do
  describe 'Validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :age }
    it { should validate_presence_of :job }
  end

  describe 'Relationships' do
    it { should have_many :astronaut_missions}
    it { should have_many(:missions).through(:astronaut_missions)}
  end

  describe 'Class methods' do
    it 'self.average_age' do
      astro1 = Astronaut.create!(name: 'Buzz Aldrin', age: 30, job: 'Space Walk')
      astro2 = Astronaut.create!(name: 'Niel Armstrong', age: 40, job: 'Moon Walk')

      expect(Astronaut.average_age).to eq(35)
    end
  end
end
