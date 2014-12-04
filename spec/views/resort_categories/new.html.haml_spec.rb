require 'rails_helper'

RSpec.describe "resort_categories/new", :type => :view, broken: true do
  before(:each) do
    assign(:resort_category, ResortCategory.new(
      :name => "MyString",
      :description => "MyText"
    ))
  end

  it "renders new resort_category form" do
    render

    assert_select "form[action=?][method=?]", resort_categories_path, "post" do

      assert_select "input#resort_category_name[name=?]", "resort_category[name]"

      assert_select "input#resort_category_parent_id[name=?]", "resort_category[parent_id]"

      assert_select "textarea#resort_category_description[name=?]", "resort_category[description]"
    end
  end
end
