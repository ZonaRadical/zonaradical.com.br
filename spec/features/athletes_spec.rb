require 'rails_helper'

feature 'athletes' do
  background do
    @user = create(:user)
    @athlete = create(:athlete)
  end

  scenario 'admin can change athlete role', :focus do
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
end