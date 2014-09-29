require 'rails_helper'

RSpec.describe "Resorts", :type => :request do
  subject { page }

  describe 'GET /resorts' do
    100.times { FactoryGirl.create(:resort) }
    before { visit resorts_path }
    describe 'with pagination' do
      it { should have_css('div.pagination')  }
    end
  end
end
