class Resort < ActiveRecord::Base

  validates :name, presence: true
  validates :image, presence: true
  validates :country_id, presence: true

  belongs_to :country

  mount_uploader :image, ResortImageUploader
end
