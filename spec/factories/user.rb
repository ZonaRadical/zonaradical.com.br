FactoryGirl.define do
  factory :user do
    name     'Test user'
    surname  'TestUser'
    email    'mail@mail123.ru'
    password 'foobar'
    password_confirmation 'foobar'
    confirmed_at Time.now

    factory :admin do
      name 'AdminUser'
      surname 'AdminUser'
      email 'admin@mail.com'
      after(:create){|u| u.roles << create(:role, name: 'admin')}
    end

    factory :editor do
      name 'EditorUser'
      surname 'EditorUser'
      email 'editor@mail.com'
      after(:create){|u| u.roles << create(:role, name: 'editor')}
    end

    factory :athlete do
      name 'AthleteUser'
      surname 'AthleteUser'
      email 'athlete@mail.com'
      after(:create) { |u| u.roles << create(:role, name: 'athlete') }
    end
  end
end
