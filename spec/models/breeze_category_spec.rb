require 'rails_helper'

RSpec.describe BreezeCategory, :type => :model do

  it "Can be instantiated" do
    expect(BreezeCategory.new).to be_an_instance_of(BreezeCategory)
  end

  it { should have_many(:breezes) }
  it { should validate_presence_of(:name) }

end
