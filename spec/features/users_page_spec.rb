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

  scenario 'user can edit bio with html editor' do
    login(@user)
    visit edit_user_path(@user)

    expect(page).to have_css('textarea#user_bio.froala')

    fill_in :user_bio, with: '<p>some text!</p>'
    first('div.actions').click_button 'Update User'

    expect(page).to have_selector('p', text: 'some text!')
    expect(page).to_not have_content('<p>some text!</p>')
  end
end