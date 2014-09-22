require 'rails_helper'

RSpec.describe "Resorts", :type => :request do
  describe "GET /resorts" do
    it "Should see all resort page" do
      @resort = FactoryGirl.create(:resort)

    end
  end
end
