require 'rails_helper'

RSpec.describe ImageGallery, :type => :model do

  it "Can be instantiated" do
    expect(ImageGallery.new).to be_an_instance_of(ImageGallery)
  end

  it { should have_many(:gallery_images) }
  it { should belong_to(:image_gallerable) }
  it { should validate_presence_of(:title) }

end
