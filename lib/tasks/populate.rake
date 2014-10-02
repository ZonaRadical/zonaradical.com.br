namespace :db do
  desc 'Erase and fill database'
  task populate: :environment do
    require 'populator'
    require 'faker'

    Resort.delete_all
    Resort.populate 200 do |resort|
      resort.name = Populator.words(1..3).titleize
      resort.web = Faker::Internet.domain_name
      resort.fb = Faker::Internet.domain_name
      resort.resort_category_id = 1..10
      resort.level1_description = Populator.sentences(1..20)
      resort.airport = 100..10000
      resort.altitude_top = 2000..4000
      resort.altitude_bottom = 100..1800
      resort.drop = 10..300
      resort.terrain = 100.1000
      resort.lifts = 0..100
      resort.slopes = 0..100
    end

    # добавляем страны
    ResortCategory.delete_all
    north = ResortCategory.create(:name => 'North')
    south = ResortCategory.create(:name => 'South')

    ResortCategory.create(:name => 'Alps', :description => 'Альпы наше все', :parent => north)
    ResortCategory.create(:name => 'Corpats', :description => 'Корпаты наше тоже ничего', :parent => north)

    ResortCategory.create(:name => 'Some Area', :parent => south)
    ResortCategory.create(:name => 'Some Area 2', :parent => south)


  end
end