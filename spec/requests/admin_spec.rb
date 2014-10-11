require 'rails_helper'
include Warden::Test::Helpers

describe 'ActiveAdmin', :type => :request do

  subject { page }

  describe 'Logged in as User' do
    before(:each) do
      @user = FactoryGirl.create(:user)
      login_as @user, :scope => :user
      visit admin_root_path
    end

    it { should have_content 'You are not authorized to perform this action.'}
    it { should have_http_status(200) }
  end

  describe 'Logged in as Editor' do
    before(:each) do
      @editor = FactoryGirl.create(:editor)
      login_as @editor, :scope => :user
      visit admin_root_path
    end

    it { should have_content 'You are not authorized to perform this action.'}
    it { should have_http_status(200) }
  end

  describe 'Logged in as admin' do
    before(:each) do
      @admin = FactoryGirl.create(:admin)
      login_as @admin, :scope => :user
      visit admin_root_path
    end

    it { should have_link('Active Admin','http://www.activeadmin.info/') }
    it { should have_http_status(200) }
  end
end
