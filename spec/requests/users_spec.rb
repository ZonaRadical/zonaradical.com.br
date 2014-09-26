require 'rails_helper'
include Warden::Test::Helpers

describe 'Users', :type => :request do

  subject { page }


  describe 'Logged in as admin' do
    before(:each) do
      @admin = FactoryGirl.create(:admin)
      login_as @admin, :scope => :user
      visit edit_user_path(@admin.id)
    end


    it { should have_css('h1', :text => 'Editing profile') }
    it { should have_content(I18n.t('assignedRoles')) }
  end
end
