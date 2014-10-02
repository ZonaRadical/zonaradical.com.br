require 'rails_helper'

RSpec.describe "resort_categories/index", :type => :view do
  before(:each) do
    assign(:resort_categories, [
      ResortCategory.create!(
        :name => "Name",
        :parent_id => 1,
        :description => "MyText"
      ),
      ResortCategory.create!(
        :name => "Name",
        :parent_id => 1,
        :description => "MyText"
      )
    ])
  end

  it "renders a list of resort_categories" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
