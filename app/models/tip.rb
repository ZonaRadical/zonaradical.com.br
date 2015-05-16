# create_table :tips, force: true do |t|
#   t.string   :title
#   t.text     :level1_description
#   t.integer  :tip_category_id
#   t.string   :image
#   t.datetime :created_at
#   t.datetime :updated_at
#   t.string   :short_description
#   t.text     :level2_description
#   t.text     :level3_description
#   t.string   :slug
# end

class Tip < ActiveRecord::Base
  include Slug
  slugged :title

  validates :title, presence: true
  validates :tip_category_id, presence: true

  belongs_to :tip_category
  has_many :gallery_images, as: :gallerable

  mount_uploader :image, TipImageUploader
end
