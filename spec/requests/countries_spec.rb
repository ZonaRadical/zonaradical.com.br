require 'rails_helper'

RSpec.describe "Country", :type => :request do
  subject { page }

  describe 'show' do
    50.times { FactoryGirl.create(:resort) }
    before do
      @country= Country.find(1)
      visit country_path(@country.id)
    end

    it { should have_css('h2', :text => @country.name) }
    it { should have_content(@country.description) }
    it { should have_css('div.pagination')  }

  end
end
