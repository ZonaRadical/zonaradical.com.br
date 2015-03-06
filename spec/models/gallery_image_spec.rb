require 'rails_helper'

RSpec.describe GalleryImage, :type => :model do

  it "Can be instantiated" do
    expect(GalleryImage.new).to be_an_instance_of(GalleryImage)
  end

  it { should respond_to(:galerable) }
end
