require 'rails_helper'

feature 'users page' do
  background do
    @user = create(:user)
  end

  scenario 'user seen profile' do
    visit root_path
    fill_in 'user_email', with: @user.email
    fill_in 'user_password', with: 'foobar'
    click_button 'Sign in'
    #click_link 'Sign Out'

    visit user_path(@user)
    expect(page).to have_content('User profile ' + @user.name)
  end
end