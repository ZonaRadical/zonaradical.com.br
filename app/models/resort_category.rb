# create_table :resort_categories, force: true do |t|
#   t.string  :name
#   t.text    :description
#   t.string  :ancestry
#   t.string  :index
#   t.integer :ancestry_depth, default: 0
#   t.string  :image
#   t.string  :slug
# end

class ResortCategory < ActiveRecord::Base
  include Slug
  slugged :name

  has_ancestry( :cache_depth => true )

  has_many :resorts
  validates :name, presence: true
  mount_uploader :image, CategoryImageUploader

end
