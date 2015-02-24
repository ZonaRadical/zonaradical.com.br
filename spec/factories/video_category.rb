FactoryGirl.define do
  factory :video_category do
    sequence(:name) { |n| "Category #{n}" }
  end
end