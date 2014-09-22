FactoryGirl.define do
  factory :user do
    name     "Test User"
    email    "testmail@mail.com"
    password "foobar"
    password_confirmation "foobar"
    confirmed_at Time.now

    factory :admin do
      roles [Role.find_by_name('admin')]
    end
  end

  factory :resort do
    name   'MyString'
    image  File.open(Rails.root.join('app/assets/images/article-1.jpg'))
    country_id  1
    web  'MyString'
    fb  'MyString'
    airport  3000
    altitude_top  2500
    altitude_bottom  1000
    drop  500
    terrain  10
    lifts  10
    slopes  "10/20/60"
    level1_description  'MyText'
    level2_description  'MyText'
    level3_description  'MyText'
  end
end