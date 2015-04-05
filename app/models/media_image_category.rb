# create_table :media_image_categories, force: true do |t|
#   t.string   :name
#   t.text     :description
#   t.string   :ancestry
#   t.string   :index
#   t.integer  :ancestry_depth, default: 0
#   t.datetime :created_at
#   t.datetime :updated_at
#   t.string   :image
# end

class MediaImageCategory < ActiveRecord::Base
  has_ancestry( :cache_depth => true )

  validates :name, presence: true
  has_many :image_galleries, as: :image_gallerable
  mount_uploader :image, CategoryImageUploader

end
