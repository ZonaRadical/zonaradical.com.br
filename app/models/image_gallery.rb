# create_table :image_galleries, force: true do |t|
#   t.string   :title
#   t.text     :description
#   t.integer  :image_gallerable_id
#   t.datetime :created_at
#   t.datetime :updated_at
#   t.string   :image_gallerable_type
# end
#
# add_index :image_galleries, [:image_gallerable_id, :image_gallerable_type], name: :index_image_gallerable_polymorphic, using: :btree

class ImageGallery < ActiveRecord::Base
  has_many :gallery_images, as: :gallerable
  belongs_to :image_gallerable, polymorphic: true

  validates :title, presence: true
  # @todo Add in the tests
  # validates :gallery_images, presence: true
end
