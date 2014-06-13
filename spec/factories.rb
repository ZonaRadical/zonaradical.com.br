FactoryGirl.define do
  factory :user do
    name     "Test User"
    email    "testmail@mail.com"
    password "foobar"
    password_confirmation "foobar"
  end
end