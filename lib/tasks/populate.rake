namespace :db do
  desc 'Erase and fill database'
  task populate: :environment do
    require 'populator'
    require 'faker'

    ResortCategory.delete_all
    ResortCategory.populate 100 do |resort_category|
      resort_category.name = Populator.words(1..3).titleize
      resort_category.description = Populator.sentences(1..20)
      resort_category.parent_id = 0..10
    end

    Resort.delete_all
    Resort.populate 200 do |resort|
      resort.name = Populator.words(1..3).titleize
      resort.web = Faker::Internet.domain_name
      resort.fb = Faker::Internet.domain_name
      resort.resort_category_id = 1..100
      resort.level1_description = Populator.sentences(1..20)
      resort.airport = 100..10000
      resort.altitude_top = 2000..4000
      resort.altitude_bottom = 100..1800
      resort.drop = 10..300
      resort.terrain = 100.1000
      resort.lifts = 0..100
      resort.slopes = 0..100
    end


  end
end