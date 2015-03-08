FactoryGirl.define do
  factory :forem_category, class: Forem::Category do
    sequence(:name) { |n| "Forem Category #{n}" }
  end
end