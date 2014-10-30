namespace :db do
  desc 'Erase and fill database'
  task populate: :environment do
    require 'populator'
    require 'faker'

    Resort.delete_all

    # добавляем страны
    ResortCategory.delete_all
    north = ResortCategory.create(:name => 'North')
    south = ResortCategory.create(:name => 'South')

    alps = ResortCategory.create(:name => 'Alps', :description => Populator.sentences(1..20), :parent => north)
    fill_resort_category(alps, 100)

    corpats = ResortCategory.create(:name => 'Corpats', :description => Populator.sentences(1..20), :parent => north)
    fill_resort_category(corpats, 100)

    cat = ResortCategory.create(:name => Populator.words(1..3).titleize,
                                :description => Populator.sentences(1..20),
                                :parent => south)
    fill_resort_category(cat, 100)

    cat = ResortCategory.create(:name => Populator.words(1..3).titleize,
                                :description => Populator.sentences(1..20),
                                :parent => south)
    fill_resort_category(cat, 100)


    Tip.delete_all
    TipCategory.delete_all
    root_left = TipCategory.create(:name => Populator.words(1..3).titleize)
    root_right = TipCategory.create(:name => Populator.words(1..3).titleize)

    lvl2_1 = TipCategory.create(:name => Populator.words(1..3).titleize,
                              :description => Populator.sentences(1..20),
                              :parent => root_left)
    fill_tip_category(lvl2_1, 100)
    lvl2_2 = TipCategory.create(:name => Populator.words(1..3).titleize,
                              :description => Populator.sentences(1..20),
                              :parent => root_left)
    fill_tip_category(lvl2_2, 100)
  end


  def fill_resort_category(category,qty=100)
    (1..qty).each do
      category.resorts.create(
          :name => Populator.words(1..3).titleize,
          :web => 'http://' + Faker::Internet.domain_name,
          :fb => 'http://' + Faker::Internet.domain_name,
          :map_url => 'http://' + Faker::Internet.domain_name,
          :level1_description => Populator.sentences(1..20),
          :short_description => Populator.sentences(1..20),
          :airport => Populator.words(1).titleize,
          :altitude_top => 2000..4000,
          :altitude_bottom => 100..1800,
          :drop => 10..300,
          :terrain => 100.1000,
          :lifts => 0..100,
          :slopes => Populator.words(1..4).titleize,
      )
    end
  end

  def fill_tip_category(category,qty)
    (1..qty).each do
      category.tips.create(
          :title => Populator.words(1..3).titleize,
          :body => Populator.sentences(1..20),
      )
    end
  end
end