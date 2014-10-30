class TipCategory < ActiveRecord::Base
  has_ancestry( :cache_depth => true )

  has_many :tips
  validates :name, presence: true
end
