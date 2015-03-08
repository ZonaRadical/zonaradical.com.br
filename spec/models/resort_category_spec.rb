require 'rails_helper'

RSpec.describe ResortCategory, :type => :model do

  it "Can be instantiated" do
    expect(ResortCategory.new).to be_an_instance_of(ResortCategory)
  end

  it { should have_many(:resorts) }
  it { should validate_presence_of(:name) }
end
