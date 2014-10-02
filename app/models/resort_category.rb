class ResortCategory < ActiveRecord::Base
  has_many :resorts
  acts_as_tree order: 'name'

  validates :name, presence: true
end
