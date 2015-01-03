# create_table :media_image_categories, force: true do |t|
#   t.string   :name
#   t.text     :description
#   t.string   :ancestry
#   t.string   :index
#   t.integer  :ancestry_depth, default: 0
#   t.datetime :created_at
#   t.datetime :updated_at
# end

class MediaImageCategory < ActiveRecord::Base
  has_ancestry( :cache_depth => true )

  has_many :image_galleries
end
