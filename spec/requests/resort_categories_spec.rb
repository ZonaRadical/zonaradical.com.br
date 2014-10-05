require 'rails_helper'
include Warden::Test::Helpers

RSpec.describe "ResortCategories", :type => :request do
  subject { page }

  before do
    @resort_category = FactoryGirl.create(:resort_category)
    @editor = FactoryGirl.create(:editor)
    @admin = FactoryGirl.create(:admin)
  end

  describe 'guest' do
    describe "All resort_categories" do
      before { visit resort_categories_path }

      it { should have_http_status(200) }
      it { should_not have_link 'New Resort category', new_resort_category_path}
      it { should have_content 'You are not authorized to access this page.'}
    end

    describe " resort_category" do
      before { visit resort_category_path(@resort_category) }

      it { should have_http_status(200) }
      it { should_not have_link 'New Resort category', new_resort_category_path}
      it { should_not have_content 'You are not authorized to access this page.'}
      it { should have_css 'h2', :text => @resort_category.name }

    end
  end

  describe 'Editor' do
    before do
      login_as @editor, :scope => :user
    end
    describe "All resort_categories" do
      before { visit resort_categories_path }

      it { should have_http_status(200) }
      it { should have_link 'New Resort category', new_resort_category_path}
      it { should_not have_content 'You are not authorized to access this page.'}
    end

    describe " resort_category" do
      before { visit resort_category_path(@resort_category) }

      it { should have_http_status(200) }
      it { should have_link 'New Resort category', new_resort_category_path}
      it { should_not have_content 'You are not authorized to access this page.'}
      it { should have_css 'h2', :text => @resort_category.name }

    end
  end
end
