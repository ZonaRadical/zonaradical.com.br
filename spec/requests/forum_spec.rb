require 'rails_helper'
include Warden::Test::Helpers

describe 'Forum', :type => :request do

  subject { page }

  describe 'Logged in as User' do
    before(:each) do
      @user = FactoryGirl.create(:user)
      login_as @user, :scope => :user
      visit forem_path
    end


    it { should have_css('div#forums_container') }
    it { should have_css('h2',:text => I18n.t('forem.forums.index.title')) }
    it { should_not have_link(I18n.t("area", :scope => 'forem.admin'),forem.admin_root_path) }
    it { should have_http_status(200) }
  end

  describe 'Logged in as admin' do
    before(:each) do
      @admin = FactoryGirl.create(:admin)
      @admin.save
      login_as @admin, :scope => :user
      visit forem_path
    end


    it { should have_css('div#forums_container') }
    it { should have_css('h2',:text => I18n.t('forem.forums.index.title')) }
    it { should have_link(I18n.t("area", :scope => 'forem.admin'),forem.admin_root_path) }
    it { should have_http_status(200) }
  end
end
