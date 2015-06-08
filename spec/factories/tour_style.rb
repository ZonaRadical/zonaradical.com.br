FactoryGirl.define do
  factory :tour_style do
    sequence(:name) { |n| "Style #{n}" }
  end
end
