FactoryGirl.define do
  sequence :email do |n|
    "person#{n}@example.com"
  end

  factory :role do
  end

  factory :user do
    name     'Test user'
    email     'mail@mail123.ru'
    password 'foobar'
    password_confirmation 'foobar'
    confirmed_at Time.now

    factory :admin do
      name 'Admin'
      email 'admin@mail.com'
      after(:create){|u| u.roles << create(:role, name: 'admin')}
    end

    factory :editor do
      name 'Editor'
      email 'editor@mail.com'
      after(:create){|u| u.roles << create(:role, name: 'editor')}
    end
  end



  factory :resort_category do
    name  'Category Name'
    description 'Some description for the country'
  end





  #   t.datetime :created_at
  #   t.datetime :updated_at
  #   t.string   :map_url

  factory :resort do
    name   'MyString'
    image  File.open(Rails.root.join('app/assets/images/article-1.jpg'))
    resort_category
    web  'http://web.link.com'
    fb  'http://fb.link.com'
    map_url 'http://map.link.com'
    airport  'Nearest airport'
    altitude_top  2500
    altitude_bottom  1000
    drop  500
    terrain  10
    lifts  10
    slopes  "10/20/60"
    level1_description  'Level description 1'
    level2_description  'Level description 2'
    level3_description  'Level description 3'
  end


end