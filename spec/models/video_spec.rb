require 'rails_helper'

RSpec.describe Video, :type => :model do

  it "Can be instantiated" do
    expect(Video.new).to be_an_instance_of(Video)
  end

  it { should belong_to(:video_category) }
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:source_link) }

end
