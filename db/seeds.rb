# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# Add Roles
Role.find_or_create_by(:name => 'admin')
Role.find_or_create_by(:name => 'editor')
Role.find_or_create_by(:name => 'athlete')
Role.find_or_create_by(:name => 'agency')
Role.find_or_create_by(:name => 'organization')

# Add Tour Style
TourStyle.find_or_create_by(:name => 'Tudo misto',:description => 'Um pouco de tudo sem fanatismo')
TourStyle.find_or_create_by(:name => 'Esporte Puro',:description => 'Pura radicalização de snowboard. Sem pensar em algo a mais')
TourStyle.find_or_create_by(:name => 'Só passeio',:description => 'Uma viagem tranquila aproveitando a beleza do mundo')
