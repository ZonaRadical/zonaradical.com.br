require "rails_helper"

RSpec.describe ResortCategoriesController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/resort_categories").to route_to("resort_categories#index")
    end

    it "routes to #new" do
      expect(:get => "/resort_categories/new").to route_to("resort_categories#new")
    end

    it "routes to #show" do
      expect(:get => "/resort_categories/1").to route_to("resort_categories#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/resort_categories/1/edit").to route_to("resort_categories#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/resort_categories").to route_to("resort_categories#create")
    end

    it "routes to #update" do
      expect(:put => "/resort_categories/1").to route_to("resort_categories#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/resort_categories/1").to route_to("resort_categories#destroy", :id => "1")
    end

  end
end
