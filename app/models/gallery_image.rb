# # can't find table `resort_gallery_images`

class GalleryImage < ActiveRecord::Base

  belongs_to :galerable, polymorphic: true
  mount_uploader :image, GalleryImageUploader
end
