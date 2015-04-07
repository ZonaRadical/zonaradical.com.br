# create_table :tours, force: true do |t|
#   t.integer  :tour_style_id
#   t.integer  :accommodation_id
#   t.string   :title
#   t.string   :description
#   t.string   :whats_included
#   t.integer  :duration
#   t.date     :check_in
#   t.date     :switch_off
#   t.string   :img
#   t.decimal  :price,            precision: 5, scale: 0
#   t.boolean  :published
#   t.datetime :created_at
#   t.datetime :updated_at
# end
#
# add_index :tours, [:accommodation_id], name: :index_tours_on_accommodation_id, using: :btree
# add_index :tours, [:tour_style_id], name: :index_tours_on_tour_style_id, using: :btree

class Tour < ActiveRecord::Base
  belongs_to :tour_style
  belongs_to :accommodation
  has_many :owners
  has_many :participants
  has_many :gallery_images, as: :gallerable

  private

  def self.use_relative_model_naming?
    true
  end
end
