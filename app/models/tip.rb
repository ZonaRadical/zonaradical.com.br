class Tip < ActiveRecord::Base

  validates :title, presence: true
  validates :level1_description, presence: true
  validates :tip_category_id, presence: true

  belongs_to :tip_category

  mount_uploader :image, TipImageUploader
end
