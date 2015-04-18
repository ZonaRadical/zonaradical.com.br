require 'rails_helper'

feature 'athletes' do
  background do
    @user = create(:user)
    @athlete = create(:athlete)
  end

  scenario 'admin can change athlete role' do
    admin = create(:admin)
    login(admin)
    
    # remove the athlete role
    visit edit_user_path(@athlete)
    within('#tab_roles') do
      expect(page).to have_content('athlete')
      athlete_li = find('li', text: 'athlete')
      athlete_li.find('input').set(true)
    end
    click_button 'Update User'
    within('#tab_roles') do
      athlete_li = find('li', text: 'athlete')
      expect(athlete_li.find('input')).to be_checked
    end
    expect(page).to have_content('Profile was successfully updated.')

    # add athlete role
    visit edit_user_path(@user)
    within('#tab_roles') do
      expect(page).to have_content('athlete')
      athlete_li = find('li', text: 'athlete')
      athlete_li.find('input').set(true)
    end
    click_button 'Update User'
    within('#tab_roles') do
      athlete_li = find('li', text: 'athlete')
      expect(athlete_li.find('input')).to be_checked
    end
    expect(page).to have_content('Profile was successfully updated.')
  end

  scenario 'Galera ZR has an "Athletes" menu item' do
    create(:athlete, name: 'João', email: 'joao@mail.com')
    create(:athlete, name: 'Zeferino', email: 'zeferino@mail.com')
    create(:athlete, name: 'Duda', email: 'duda@mail.com')
    
    visit root_path
    galera_zr_menu = find('li.submenu-item', text: 'Galera Snow')
    athletes_menu = galera_zr_menu.find('ul.submenu').find('li', text: 'Athletes')
    athletes_menu.click_link('Athletes')

    within('.profile-athl-card:nth-of-type(2)') do
      expect(page).to have_content('Duda')
      #expect(page).to have_content('Contacts : duda@mail.com')
    end
    within('.profile-athl-card:nth-of-type(3)') do
      expect(page).to have_content('João')
      #expect(page).to have_content('Contacts : joao@mail.com')
    end
    within('.profile-athl-card:nth-of-type(4)') do
      expect(page).to have_content('Zeferino')
      #expect(page).to have_content('Contacts : zeferino@mail.com')
    end
  end
end