require 'rails_helper'
include Warden::Test::Helpers

describe 'StaticPages', :type => :request do

  subject { page }

  describe 'Home' do
    before { visit root_path }

    it { should have_link( I18n.t('forum') ) }
    it { should have_link( I18n.t('resorts') ) }
    it { should have_link( I18n.t('home') ) }
    it { should have_content( I18n.t('signIn') ) }
    it { should_not have_link( I18n.t('signOut') ) }

    describe 'Logged in User' do
      before(:each) do
        @user = FactoryGirl.create(:user)

        login_as @user, :scope => :user
        visit root_path
      end

      it { should have_link( @user.name, :href => profile_path ) }
      it { should_not have_content( I18n.t('signIn') ) }
      it { should have_link( I18n.t('signOut') ) }
      it { should_not have_link( I18n.t('newResort'), :href => new_resort_path ) }
      it { should_not have_link( I18n.t('newCountry'), :href => new_country_path ) }


    end

    describe 'Logged in as admin' do
      before(:each) do
        @admin = FactoryGirl.create(:admin)
        login_as @admin, :scope => :user
        visit root_path
      end

      it { should have_link( I18n.t('newResort'), :href => new_resort_path ) }
    end

  end
end
