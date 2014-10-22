class Resort < ActiveRecord::Base

  validates :name, presence: true
  validates :resort_category_id, presence: true
  validates :fb, format: { with: URI.regexp }, allow_blank: true
  validates :web, format: { with: URI.regexp }, allow_blank: true
  validates :map_url, format: { with: URI.regexp }, allow_blank: true

  belongs_to :resort_category

  mount_uploader :image, ResortImageUploader
end
