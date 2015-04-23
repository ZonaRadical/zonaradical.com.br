require 'rails_helper'

feature 'active menu' do
  scenario 'main menu of current page is highlighted' do
    create(:video_category, name: 'Digiácomo Dias')
    create(:resort_category, name: 'North')
    create(:tip_category, name: 'Id Odit Molestiae')

    visit root_path
    
    within 'ul.menu' do click_link 'Home' end
    within 'ul.menu' do
      expect(page).to have_selector('a.active', text: 'Home')
      expect(page).to have_selector('a.active', count: 1)
    end
    within 'ul.menu' do click_link 'Digiácomo Dias' end
    within 'ul.menu' do
      expect(page).to have_selector('a.active', text: 'Home')
      expect(page).to have_selector('a.active', count: 1)
    end

    within 'ul.menu' do click_link 'Resorts' end
    within 'ul.menu' do
      expect(page).to have_selector('a.active', text: 'Resorts')
      expect(page).to have_selector('a.active', count: 1)
    end
    within 'ul.menu' do click_link 'North' end
    within 'ul.menu' do
      expect(page).to have_selector('a.active', text: 'Resorts')
      expect(page).to have_selector('a.active', count: 1)
    end
    
    within 'ul.menu' do click_link 'Tips' end
    within 'ul.menu' do
      expect(page).to have_selector('a.active', text: 'Tips')
      expect(page).to have_selector('a.active', count: 1)
    end
    within 'ul.menu' do click_link 'Id Odit Molestiae' end
    within 'ul.menu' do
      expect(page).to have_selector('a.active', text: 'Tips')
      expect(page).to have_selector('a.active', count: 1)
    end

    # within 'ul.menu' do
    #   click_link 'Vamo junto'
    # end
    # expect(page).to have_selector('a.active', text: 'Vamo junto')
    # expect(page).to have_selector('a.active', count: 1)

    
    # within 'ul.menu' do
    #   click_link 'Galera ZR'
    # end
    # expect(page).to have_selector('a.active', text: 'Galera ZR')
    # expect(page).to have_selector('a.active', count: 1)
  end
end