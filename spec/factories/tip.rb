FactoryGirl.define do
  factory :tip do
    title 'Name'
    image File.open(Rails.root.join('spec/fixtures/files/upload.jpg'))
    tip_category
    level1_description 'Description level 1'
    level2_description 'Description level 2'
    level3_description 'Description level 3'
    short_description 'Short description'
    after(:build) do |tip|
      tip.gallery_images << FactoryGirl.build(:gallery_image)
    end
  end
end
