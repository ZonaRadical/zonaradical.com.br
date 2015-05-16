# create_table :tip_categories, force: true do |t|
#   t.string   :name
#   t.text     :description
#   t.string   :ancestry
#   t.string   :index
#   t.integer  :ancestry_depth, default: 0
#   t.datetime :created_at
#   t.datetime :updated_at
#   t.string   :image
#   t.string   :slug
# end

class TipCategory < ActiveRecord::Base
  has_ancestry( :cache_depth => true )

  has_many :tips
  validates :name, presence: true
  mount_uploader :image, CategoryImageUploader

end
