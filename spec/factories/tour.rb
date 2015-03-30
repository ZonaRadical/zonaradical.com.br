FactoryGirl.define do
  factory :tour do

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