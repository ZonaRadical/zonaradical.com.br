# create_table :resort_gallery_images, force: true do |t|
#   t.integer  :resort_id
#   t.string   :image
#   t.text     :description
#   t.datetime :created_at
#   t.datetime :updated_at
# end

class ResortGalleryImage < ActiveRecord::Base

  belongs_to :resort
  mount_uploader :image, ResortGalleryImageUploader
end
