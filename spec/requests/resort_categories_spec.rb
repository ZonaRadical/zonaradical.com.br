require 'rails_helper'

RSpec.describe "ResortCategories", :type => :request do
  describe "GET /resort_categories" do
    it "works! (now write some real specs)" do
      get resort_categories_path
      expect(response).to have_http_status(200)
    end
  end
end
