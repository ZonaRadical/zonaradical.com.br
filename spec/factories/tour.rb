FactoryGirl.define do
  factory :tour do
    sequence(:title) { |n| "Tour #{n}" }
    tour_style_id 1
    description 'Tour description'
    check_in_y 2015
    check_in_m 1
    resort_category_ids   [2]
    resort_ids            [13]

    factory :tour_with_owners do
      transient do
        users []
      end

      after(:create) do |tour, evaluator|
        evaluator.users.each do |user|
          tour.owners.create(user: user)
        end
      end
    end
  end
end
