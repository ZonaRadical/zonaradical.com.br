FactoryGirl.define do
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
