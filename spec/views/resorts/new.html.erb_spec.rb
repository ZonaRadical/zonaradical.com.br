require 'rails_helper'

RSpec.describe "resorts/new", :type => :view do
  before(:each) do
    assign(:resort, Resort.new(
      :name => "MyString",
      :image => "MyString",
      :country_id => 1,
      :link => "MyString",
      :link_to_map => "MyString",
      :level1_description => "MyText",
      :level2_description => "MyText",
      :level3_description => "MyText"
    ))
  end

  it "renders new resort form" do
    render

    assert_select "form[action=?][method=?]", resorts_path, "post" do

      assert_select "input#resort_name[name=?]", "resort[name]"

      assert_select "input#resort_image[name=?]", "resort[image]"

      assert_select "input#resort_country_id[name=?]", "resort[country_id]"

      assert_select "input#resort_link[name=?]", "resort[link]"

      assert_select "input#resort_link_to_map[name=?]", "resort[link_to_map]"

      assert_select "textarea#resort_level1_description[name=?]", "resort[level1_description]"

      assert_select "textarea#resort_level2_description[name=?]", "resort[level2_description]"

      assert_select "textarea#resort_level3_description[name=?]", "resort[level3_description]"
    end
  end
end
