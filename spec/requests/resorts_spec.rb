require 'rails_helper'

RSpec.describe "Resorts", :type => :request, broken: true do
  subject { page }

  describe 'GET /resorts' do
    parent = FactoryGirl.create(:resort_category, :name => "Test Category")
    FactoryGirl.build_list(:resort_category, 1)
    100.times { FactoryGirl.create(:resort, :resort_category_id => parent.id) }
    before { visit resorts_path }
    describe 'with pagination' do
      it { should have_css('div.pagination')  }
    end
  end
end
