require 'rails_helper'

RSpec.describe "resorts/edit", :type => :view do
  before(:each) do
    @resort = FactoryGirl.create(:resort)
  end

  it 'renders the edit resort form' do
    render

    assert_select "form[action=?][method=?]", resort_path(@resort), "post" do

      assert_select "input#resort_name[name=?]", "resort[name]"

      assert_select "input#resort_image[name=?]", "resort[image]"

      assert_select "input#resort_country_id[name=?]", "resort[country_id]"

      assert_select "input#resort_link[fb=?]", "resort[fb]"

      assert_select "input#resort_link[web=?]", "resort[web]"

      assert_select "textarea#resort_level1_description[name=?]", "resort[level1_description]"

      assert_select "textarea#resort_level2_description[name=?]", "resort[level2_description]"

      assert_select "textarea#resort_level3_description[name=?]", "resort[level3_description]"
    end
  end
end
