require 'rails_helper'

feature 'active menu' do
  scenario 'main menu of current page is highlighted' do
    visit root_path
    
    within 'ul.menu' do
      click_link 'Home'
    end
    expect(page).to have_selector('a.active', text: 'Home')
    expect(page).to have_selector('a.active', count: 1)
    
    within 'ul.menu' do
      click_link 'Resorts'
    end
    expect(page).to have_selector('a.active', text: 'Resorts')
    expect(page).to have_selector('a.active', count: 1)
    
    within 'ul.menu' do
      click_link 'Tips'
    end
    expect(page).to have_selector('a.active', text: 'Tips')
    expect(page).to have_selector('a.active', count: 1)
    
    # within 'ul.menu' do
    #   click_link 'Vamo junto'
    # end
    # expect(page).to have_selector('a.active', text: 'Vamo junto')
    # expect(page).to have_selector('a.active', count: 1)
    
    within 'ul.menu' do
      click_link 'Forum'
    end
    expect(page).to have_selector('a.active', text: 'Forum')
    expect(page).to have_selector('a.active', count: 1)
    
    # within 'ul.menu' do
    #   click_link 'Galera ZR'
    # end
    # expect(page).to have_selector('a.active', text: 'Galera ZR')
    # expect(page).to have_selector('a.active', count: 1)
  end
end