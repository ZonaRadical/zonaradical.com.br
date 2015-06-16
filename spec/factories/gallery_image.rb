FactoryGirl.define do
  factory :gallery_image do
    image File.open(Rails.root.join('spec/fixtures/files/upload.jpg'))
    name 'Gallery Image Name'
  end
end
