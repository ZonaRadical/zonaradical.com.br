require 'rails_helper'

RSpec.describe VideoCategory, :type => :model do

  it "Can be instantiated" do
    expect(VideoCategory.new).to be_an_instance_of(VideoCategory)
  end

  it { should have_many(:videos) }
  it { should validate_presence_of(:name) }
end
