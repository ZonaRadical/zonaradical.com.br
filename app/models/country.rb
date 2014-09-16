class Country < ActiveRecord::Base
  translates :name

  acts_as_tree order: 'name'
end