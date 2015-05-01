# create_table :offers, force: true do |t|
#   t.integer  :tour_style_id
#   t.integer  :accommodation_id
#   t.string   :title
#   t.text     :description
#   t.string   :whats_included
#   t.integer  :duration
#   t.integer  :check_in_d
#   t.integer  :check_in_m
#   t.integer  :check_in_y
#   t.integer  :switch_off_d
#   t.integer  :switch_off_m
#   t.integer  :switch_off_y
#   t.date     :check_in
#   t.date     :switch_off
#   t.string   :image
#   t.decimal  :price,            precision: 5, scale: 0
#   t.boolean  :published,                                default: true
#   t.datetime :created_at
#   t.datetime :updated_at
# end
#
# add_index :offers, [:accommodation_id], name: :index_offers_on_accommodation_id, using: :btree
# add_index :offers, [:tour_style_id], name: :index_offers_on_tour_style_id, using: :btree

class Offer < ActiveRecord::Base
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

    self.check_in = check_in_d.nil? ? Date.new(check_in_y, check_in_m) : Date.new(check_in_y, check_in_m, check_in_d)
    self.switch_off = switch_off_d.nil? ? Date.new(switch_off_y, switch_off_m) : Date.new(switch_off_y, switch_off_m, switch_off_d)
  end

  def approved_participants
    participants.where(status: Tour::Participant.statuses[:approved])
  end

  def self.published
    where(published: true)
  end

  def self.switched_on
    where("switch_off >= ?", Date.today)
  end

  def self.involved(user)
    includes([:user_owners, :user_participants])
      .where("offer_user_assignments.user_id = :user_id
        OR offer_user_participant_assignments.user_id = :user_id",
        user_id: user.id)
      .references([:user_owners, :user_participants])
  end

  def self.owned_by(users)
    includes(:user_owners).where(
      offer_user_assignments: { user_id: users.collect(&:id) }
    )
  end

  def self.filter(options = {})
    offers = where(nil)
    offers = offers.includes(:resort_categories).where(resort_categories: { id: options['resort_categories'] }) if options['resort_categories']
    offers = offers.where(check_in_m: options['check_in_m'], check_in_y: options['check_in_y']) if options['check_in_m'] and options['check_in_y']
    offers = offers.where(tour_style: options['tour_style']) if options['tour_style']
    offers = offers.where(accommodation: options['accommodation']) if options['accommodation']
    offers = offers.where(price: options['cost']) if options['cost']
    if options['age_group']
      offers = offers.includes(:user_owners)
        .where(offer_user_assignments: { id: Tour::Owner.first_owners_by_tour })
        .where(users: { birthday: options['age_group'] })
    end
    offers = offers.includes(:resorts).where(resorts: { id: options['resorts'] }) if options['resorts']
    offers = offers.switched_on if options['show_passed'] == "0"
    offers
  end

  private

  def self.use_relative_model_naming?
    true
  end

  def country_presence
    errors.add(:base, :missing_country) if self.countries.empty?
  end
end
