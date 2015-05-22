# create_table :tip_categories, force: true do |t|
#   t.string   :name
#   t.text     :description
#   t.string   :index
#   t.datetime :created_at
#   t.datetime :updated_at
#   t.string   :image
#   t.string   :slug
#   t.integer  :ancestry_depth, default: 0
# end

class TipCategory < ActiveRecord::Base
  include Slug
  slugged :name

  has_many :tips
  validates :name, presence: true
  mount_uploader :image, CategoryImageUploader
end
