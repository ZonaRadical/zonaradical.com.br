require 'rails_helper'

RSpec.describe "resort_categories/show", :type => :view, broken: true do
  before(:each) do
    @resort_category = assign(:resort_category, ResortCategory.create!(
      :name => "Name",
      :parent_id => 1,
      :description => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/MyText/)
  end
end
