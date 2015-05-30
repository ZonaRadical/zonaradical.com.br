# create_table :resorts, force: true do |t|
#   t.string   :name
#   t.string   :image
#   t.string   :web
#   t.string   :fb
#   t.integer  :resort_category_id
#   t.integer  :index
#   t.text     :level1_description
#   t.text     :level2_description
#   t.text     :level3_description
#   t.string   :airport
#   t.integer  :altitude_top
#   t.integer  :altitude_bottom
#   t.integer  :drop
#   t.integer  :terrain
#   t.integer  :lifts
#   t.string   :slopes
#   t.datetime :created_at
#   t.datetime :updated_at
#   t.string   :map_url
#   t.string   :slug
# end

class Resort < ActiveRecord::Base
  include Slug
  slugged :name

  validates :name, presence: true
  validates :resort_category_id, presence: true
  validates :fb, format: { with: URI.regexp }, allow_blank: true
  validates :web, format: { with: URI.regexp }, allow_blank: true
  validates :map_url, format: { with: URI.regexp }, allow_blank: true

  belongs_to :resort_category
  has_many :gallery_images, as: :gallerable

  mount_uploader :image, ResortImageUploader
end
