require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe 'When i visit the index page' do
    it 'display astronuats with attributes' do
     astro1 = Astronaut.create!(name: 'Buzz Aldrin', age: 30, job: 'Space Walk')
     astro2 = Astronaut.create!(name: 'Niel Armstrong', age: 40, job: 'Moon Walk')

     visit '/astronauts'

     expect(page).to have_content(astro1.name)
     expect(page).to have_content(astro1.age)
     expect(page).to have_content(astro1.job)
     expect(page).to have_content(astro2.name)
     expect(page).to have_content(astro2.age)
     expect(page).to have_content(astro2.job)
   end

   it 'shows the average age of all astronauts'do
     astro1 = Astronaut.create!(name: 'Buzz Aldrin', age: 30, job: 'Space Walk')
     astro2 = Astronaut.create!(name: 'Niel Armstrong', age: 40, job: 'Moon Walk')

      visit '/astronauts'

      expect(page).to have_content(Astronaut.average_age)
    end

    it 'shows list of mission in alphabetical order for each astronaut' do
      astro3 = Astronaut.create!(name: 'Jim Lovell', age: 30, job: 'Space Walk')

      apollo = Mission.create!(title: "Apollo 13", time_in_space: 50)
      capricorn = Mission.create!(title: "Capricorn 4", time_in_space: 60)
      gemini = Mission.create!(title: "Gemini 7", time_in_space: 80)

      AstronautMission.create!(astronaut_id: astro3.id, mission_id: apollo.id)
      AstronautMission.create!(astronaut_id: astro3.id, mission_id: capricorn.id)
      AstronautMission.create!(astronaut_id: astro3.id, mission_id: gemini.id)

      visit '/astronauts'

      expect(Mission.mission_order.first).to eq(apollo)
      expect(Mission.mission_order.last).to eq(gemini)
  

    end
  end
end
