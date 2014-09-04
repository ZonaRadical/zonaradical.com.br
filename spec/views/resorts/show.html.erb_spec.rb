require 'rails_helper'

RSpec.describe "resorts/show", :type => :view do
  before(:each) do
    @resort = assign(:resort, Resort.create!(
      :name => "Name",
      :image => "Image",
      :country_id => 1,
      :link => "Link",
      :link_to_map => "Link To Map",
      :level1_description => "MyText",
      :level2_description => "MyText",
      :level3_description => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Image/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/Link/)
    expect(rendered).to match(/Link To Map/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
  end
end
