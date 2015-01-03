# create_table :image_galleries, force: true do |t|
#   t.string   :title
#   t.text     :description
#   t.integer  :media_image_category_id
#   t.datetime :created_at
#   t.datetime :updated_at
# end

class ImageGallery < ActiveRecord::Base
  has_many :gallery_images, as: :gallerable
  belongs_to :media_image_category
end
