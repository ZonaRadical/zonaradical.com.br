class Resort < ActiveRecord::Base

  validates :name, presence: true
  validates :resort_category_id, presence: true
  validates :fb, format: { with: URI.regexp }
  validates :web, format: { with: URI.regexp }
  validates :map_url, format: { with: URI.regexp }

  belongs_to :resort_category

  mount_uploader :image, ResortImageUploader
end
