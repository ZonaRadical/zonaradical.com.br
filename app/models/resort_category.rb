class ResortCategory < ActiveRecord::Base
  has_ancestry( :cache_depth => true )

  has_many :resorts
  validates :name, presence: true
end
