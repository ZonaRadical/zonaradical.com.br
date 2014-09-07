namespace :db do
  desc 'Translate country name to locale'
  task :translate_country_name_to, [:locale] do |t, args|
    puts '----------- About to translate country name ----------------'
    Carmen.i18n_backend.locale = args.locale
    Country.all.each do |country|
      country.update_attribute(:name, Carmen::Country.coded(country.code).name)
    end
  end
end
