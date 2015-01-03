# create_table :breezes, force: true do |t|
#   t.string   :title
#   t.text     :body
#   t.string   :url
#   t.string   :image
#   t.integer  :breeze_category_id
#   t.datetime :created_at
#   t.datetime :updated_at
# end

class Breeze < ActiveRecord::Base
  validates :title, presence: true
  validates :breeze_category_id, presence: true

  belongs_to :breeze_category
  mount_uploader :image, BreezeImageUploader
end
