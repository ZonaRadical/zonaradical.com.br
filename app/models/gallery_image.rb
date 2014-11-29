# create_table :gallery_images, force: true do |t|
#   t.integer  :resort_id
#   t.string   :image
#   t.text     :description
#   t.integer  :gallerable_id
#   t.string   :gallerable_type
#   t.datetime :created_at
#   t.datetime :updated_at
#   t.string   :name
#   t.string   :url
# end

class GalleryImage < ActiveRecord::Base

  belongs_to :galerable, polymorphic: true
  mount_uploader :image, GalleryImageUploader
end
