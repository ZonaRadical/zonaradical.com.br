require 'rails_helper'

feature 'users page' do
  background do
    @user = create(:user)
  end

  scenario 'never seen user' do
    visit user_path(@user)
    expect(page).to have_content('Never')
  end

  scenario 'user already seen' do
    visit root_path
    click_link 'Sign In'
    fill_in 'user_email', with: @user.email
    fill_in 'user_password', with: 'foobar'
    click_button 'Sign In'
    click_link 'Sign Out'

    visit user_path(@user)
    expect(page).to_not have_content('Never')
  end
end