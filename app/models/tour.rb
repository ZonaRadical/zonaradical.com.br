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
  has_many :user_owners, through: :owners, source: :user
  has_many :participants
  has_many :user_participants, through: :participants, source: :user
  has_many :countries
  has_many :resort_categories, through: :countries
  has_many :tour_resorts
  has_many :resorts, through: :tour_resorts
  has_many :gallery_images, as: :gallerable

  validates :tour_style, :title, :description, presence: true
  validates :check_in_y, :check_in_m, presence: true
  validates :check_in_y, :check_in_m, numericality: { only_integer: true, greater_than: 0 }
  validate :country_presence

  before_save do
    self.switch_off_d = check_in_d
    self.switch_off_m = check_in_m
    self.switch_off_y = check_in_y
  end

  def check_in_date
    check_in_d.nil? ? Date.new(check_in_y, check_in_m) : Date.new(check_in_y, check_in_m, check_in_d)
  end

  def check_in
    if check_in_d.nil?
      Date.new(check_in_y, check_in_m).strftime('%m/%Y')
    else
      Date.new(check_in_y, check_in_m, check_in_d).strftime('%d/%m/%Y')
    end
  end

  def approved_participants
    participants.where(status: Tour::Participant.statuses[:approved])
  end

  def self.published
    where(published: true)
  end

  def self.search(options = {})
    # Search destinies
    # Tour.includes(:resort_categories).where(resort_categories: { id: [3, 4] })
    # Search resorts
    # Tour.includes(:resorts).where(resorts: { id: [3, 4, 5] }).count
    # Periodo
    # Tour.where(check_in_m: 5, check_in_y: 2015)
    # Hospedagem
    # Tour.where(accommodation_id: 1)
    # Custos
    # Tour.where(price: 200..Float::INFINITY).first.id
    # Tour.where(price: 100..200).first.id
    # Tour.where(price: 100..200).first.id
    # Faixa etária
    # User.where(birthday: 99.years.ago.to_date..25.years.ago.to_date)
    # User.where(birthday: 25.years.ago.to_date..18.years.ago.to_date)
    # User.where(birthday: 18.years.ago.to_date..Date.today)
    # Tour.includes(:user_owners).where(tour_user_assignments: { id: Tour::Owner.first_owners_by_tour }).where(users: { birthday: 99.years.ago.to_date..25.years.ago.to_date })
    Tour.where()
  end

  private

  def self.use_relative_model_naming?
    true
  end

  def country_presence
    errors.add(:base, :missing_country) if self.countries.empty?
  end
end
