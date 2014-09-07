namespace :db do
  desc 'Move data from the carmen gem into the database'
  task load_geo_data: :environment do

    puts '-----------About to load geo-data from Carmen gem into the database----------------'
    Carmen::Country.all.each do |country|
      new_country = Country.create(name: country.name, code: country.code)
    end
  end
end