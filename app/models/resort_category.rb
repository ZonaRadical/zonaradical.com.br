class ResortCategory < ActiveRecord::Base
  has_ancestry

  has_many :resorts
  validates :name, presence: true
end
