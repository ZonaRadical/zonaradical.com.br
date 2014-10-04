require 'rails_helper'
include Warden::Test::Helpers

RSpec.describe "ResortCategories", :type => :request do
  subject { page }

  describe "guest" do
    before(:each) do
      visit resort_categories_path
    end

    it { should have_http_status(200) }
    it { should_not have_link 'New Resort category', new_resort_category_path}
  end

  describe "User login" do
    before(:each) do
      @user = FactoryGirl.create(:user)
      login_as @user, :scope => :user
      visit resort_categories_path
    end

    it { should have_http_status(200) }
    it { should_not have_link 'New Resort category', new_resort_category_path}
  end
end
