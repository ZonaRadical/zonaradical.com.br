# create_table :tours, force: true do |t|
#   t.integer  :tour_style_id
#   t.integer  :accommodation_id
#   t.string   :title
#   t.string   :description
#   t.string   :whats_included
#   t.integer  :duration
#   t.string   :image
#   t.decimal  :price,            precision: 5, scale: 0
#   t.boolean  :published,                                default: true
#   t.datetime :created_at
#   t.datetime :updated_at
#   t.integer  :check_in_d
#   t.integer  :check_in_m
#   t.integer  :check_in_y
#   t.integer  :switch_off_d
#   t.integer  :switch_off_m
#   t.integer  :switch_off_y
# end
#
# add_index :tours, [:accommodation_id], name: :index_tours_on_accommodation_id, using: :btree
# add_index :tours, [:tour_style_id], name: :index_tours_on_tour_style_id, using: :btree

class Tour < ActiveRecord::Base
  belongs_to :tour_style
  belongs_to :accommodation
  has_many :owners
  has_many :participants
  has_many :countries
  has_many :resort_categories, through: :countries
  has_many :tour_resorts
  has_many :resorts, through: :tour_resorts
  has_many :gallery_images, as: :gallerable

  validates :check_in_y, :check_in_m, presence: true
  validates :check_in_y, :check_in_m, numericality: { only_integer: true, greater_than: 0 }

  before_save do
    self.switch_off_d = check_in_d
    self.switch_off_m = check_in_m
    self.switch_off_y = check_in_y
  end

  def check_in
    if check_in_d.nil?
      Date.new(check_in_y, check_in_m).strftime('%m/%Y')
    else
      Date.new(check_in_y, check_in_m, check_in_d).strftime('%d/%m/%Y')
    end
  end

  def self.published
    where(published: true)
  end

  private

  def self.use_relative_model_naming?
    true
  end
end
