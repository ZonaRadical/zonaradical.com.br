class Country < ActiveRecord::Base
  translates :name, :description
  has_many :resorts

  acts_as_tree order: 'name'
end