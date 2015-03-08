# create_table :breeze_categories, force: true do |t|
#   t.string   :name
#   t.text     :description
#   t.string   :ancestry
#   t.string   :index
#   t.integer  :ancestry_depth, default: 0
#   t.datetime :created_at
#   t.datetime :updated_at
#   t.string   :image
# end

class BreezeCategory < ActiveRecord::Base
  has_ancestry( :cache_depth => true )

  has_many :breezes
  validates :name, presence: true
  mount_uploader :image, CategoryImageUploader

end
