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
  end
end
