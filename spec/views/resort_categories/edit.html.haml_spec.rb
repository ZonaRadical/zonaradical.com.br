require 'rails_helper'

RSpec.describe "resort_categories/edit", :type => :view do
  before(:each) do
    @resort_category = assign(:resort_category, ResortCategory.create!(
      :name => "MyString",
      :parent_id => 1,
      :description => "MyText"
    ))
  end

  it "renders the edit resort_category form" do
    render

    assert_select "form[action=?][method=?]", resort_category_path(@resort_category), "post" do

      assert_select "input#resort_category_name[name=?]", "resort_category[name]"

      assert_select "input#resort_category_parent_id[name=?]", "resort_category[parent_id]"

      assert_select "textarea#resort_category_description[name=?]", "resort_category[description]"
    end
  end
end
