require 'rails_helper'
include Warden::Test::Helpers

describe 'Users', :type => :request do

  subject { page }

  before(:each) do
    @user = FactoryGirl.create(:user)
    @admin = FactoryGirl.create(:admin)
    @editor = FactoryGirl.create(:editor)
  end

  describe 'Logged in as admin' do
    before { login_as @admin, :scope => :user }


    describe 'Edit own profile' do
      before { visit edit_user_path(@admin.id) }

      it { should have_css('span', :text => 'Main info') }
      it { should have_css('span', :text => 'Avatar') }
      it { should have_css('span', :text => 'Security') }
      it { should have_css('span', :text => 'Roles') }
      it { should have_content(I18n.t('assignedRoles')) }
    end

    describe 'Edit other profile' do
      before { visit edit_user_path(@user.id) }

      it { should have_css('span', :text => 'Main info') }
      it { should have_css('span', :text => 'Avatar') }
      it { should have_css('span', :text => 'Security') }
      it { should have_css('span', :text => 'Roles') }

      it { should have_content(I18n.t('assignedRoles')) }
    end

  end

  describe 'Logged in as Guest(user without role)' do
    before { login_as @user, :scope => :user }

    describe 'Edit own profile' do
      before { visit edit_user_path(@user.id) }

      it { should have_css('span', :text => 'Main info') }
      it { should have_css('span', :text => 'Avatar') }
      it { should have_css('span', :text => 'Security') }
      it { should_not have_css('span', :text => 'Roles') }
      it { should_not have_content(I18n.t('assignedRoles')) }
    end

    describe 'Edit other\'s profile' do
      before { visit edit_user_path(@editor.id) }

      it { should have_content 'You are not authorized to access this page.'}
    end

  end
end
