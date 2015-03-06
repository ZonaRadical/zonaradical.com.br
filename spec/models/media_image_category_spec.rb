require 'rails_helper'

RSpec.describe MediaImageCategory, :type => :model do

  it "Can be instantiated" do
    expect(MediaImageCategory.new).to be_an_instance_of(MediaImageCategory)
  end

  it { should have_many(:image_galleries) }
  it { should be_a_new(MediaImageCategory) }
end
