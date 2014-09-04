require 'rails_helper'

RSpec.describe "resorts/index", :type => :view do
  before(:each) do
    assign(:resorts, [
      Resort.create!(
        :name => "Name",
        :image => "Image",
        :country_id => 1,
        :link => "Link",
        :link_to_map => "Link To Map",
        :level1_description => "MyText",
        :level2_description => "MyText",
        :level3_description => "MyText"
      ),
      Resort.create!(
        :name => "Name",
        :image => "Image",
        :country_id => 1,
        :link => "Link",
        :link_to_map => "Link To Map",
        :level1_description => "MyText",
        :level2_description => "MyText",
        :level3_description => "MyText"
      )
    ])
  end

  it "renders a list of resorts" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Image".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Link".to_s, :count => 2
    assert_select "tr>td", :text => "Link To Map".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
