require 'rails_helper'

RSpec.describe Breeze, :type => :model do

  it "Can be instantiated" do
    expect(Breeze.new).to be_an_instance_of(Breeze)
  end

  it { should belong_to(:breeze_category) }
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:breeze_category_id) }

end
