require 'rails_helper'

describe Mission, type: :model do
  describe 'Validations' do
    it { should validate_presence_of :title }
    it { should validate_presence_of :time_in_space }
  end

  describe 'Relationships' do
    it { should have_many :astronaut_missions}
    it { should have_many(:astronauts).through(:astronaut_missions)}
  end

  describe 'class method' do
    it 'self.mission_order' do

      gemini = Mission.create!(title: "Gemini 7", time_in_space: 80)
      apollo = Mission.create!(title: "Apollo 13", time_in_space: 50)
      capricorn = Mission.create!(title: "Capricorn 4", time_in_space: 60)

      expect(Mission.mission_order.first).to eq(apollo)
    end

      it 'self.total_time_in_space' do

        apollo = Mission.create!(title: "Apollo 13", time_in_space: 50)
        capricorn = Mission.create!(title: "Capricorn 4", time_in_space: 60)
        gemini = Mission.create!(title: "Gemini 7", time_in_space: 80)

        expect(Mission.total_time_in_space).to eq(190)
      end
  end
end
