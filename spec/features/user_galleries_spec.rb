require 'rails_helper'

feature 'user galleries', :focus do
  BASE_PATH = "#{Rails.root}/spec/fixtures/files/user_gallery"

  scenario "athlete add images to it's profiles" do
    athlete = create(:athlete)
    login(athlete)

    within('.registered') { click_link('Athlete') }
    click_link 'Edit Profile'
    attach_file 'Add gallery images', ["#{BASE_PATH}/gallery_1.jpg", "#{BASE_PATH}/gallery_2.jpg"]
    click_button 'Update User'

    within('.slider-field') do
      expect(page).to have_selector("img[src$='gallery_1.jpg']")
      expect(page).to have_selector("img[src$='gallery_2.jpg']")
    end
  end
end