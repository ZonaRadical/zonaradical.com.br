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
    galera_zr_menu = find('li.submenu-item', text: 'Galera ZR')
    athletes_menu = galera_zr_menu.find('ul.submenu').find('li', text: 'Athletes')
    athletes_menu.click_link('Athletes')

    expect(page).to have_content('Duda duda@mail.com')
    expect(page).to have_content('João joao@mail.com')
    expect(page).to have_content('Zeferino zeferino@mail.com')
  end
end