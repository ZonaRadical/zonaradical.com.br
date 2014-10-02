class Resort < ActiveRecord::Base

  validates :name, presence: true
  validates :resort_category_id, presence: true

  belongs_to :resort_category

  mount_uploader :image, ResortImageUploader
end
