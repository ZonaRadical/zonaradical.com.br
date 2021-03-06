# create_table :tours, force: true do |t|
#   t.integer  :tour_style_id
#   t.integer  :accommodation_id
#   t.string   :title
#   t.text     :description
#   t.string   :whats_included
#   t.integer  :duration
#   t.string   :image
#   t.decimal  :price,              precision: 5, scale: 0
#   t.boolean  :published,                                  default: true
#   t.datetime :created_at
#   t.datetime :updated_at
#   t.integer  :check_in_d
#   t.integer  :check_in_m
#   t.integer  :check_in_y
#   t.integer  :switch_off_d
#   t.integer  :switch_off_m
#   t.integer  :switch_off_y
#   t.date     :check_in
#   t.date     :switch_off
#   t.integer  :discourse_topic_id
# end
#
# add_index :tours, [:accommodation_id], name: :index_tours_on_accommodation_id, using: :btree
# add_index :tours, [:tour_style_id], name: :index_tours_on_tour_style_id, using: :btree

class Tour < ActiveRecord::Base
  act_as_discoursable(
    title:        -> (tour) { tour.title },
    description:  -> (tour) { tour.description },
    category:     -> (tour) { tour.resort_categories.first.name.downcase },
    external_id:  -> (tour) { tour.owners.first.user.id }
  )
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

  def participants_in(statuses)
    statuses = statuses.collect { |item| Tour::Participant.statuses[item] }
    participants.where(status: statuses)
  end

  def self.published
    where(published: true)
  end

  def self.switched_on
    where("switch_off >= ?", Date.today)
  end

  def self.involved(user)
    includes([:user_owners, :user_participants])
      .where("tour_user_assignments.user_id = :user_id
        OR tour_user_participant_assignments.user_id = :user_id",
        user_id: user.id)
      .references([:user_owners, :user_participants])
  end

  def self.involved_as_participant(user)
    includes(:user_participants).where(
      tour_user_participant_assignments: { user_id: user.id }
    )
  end

  def self.owned_by(users)
    includes(:user_owners).where(
      tour_user_assignments: { user_id: users.collect(&:id) }
    )
  end

  def self.filter(options = {})
    tours = where(nil)
    tours = tours.includes(:resort_categories).where(resort_categories: { id: options['resort_categories'] }) if options['resort_categories']
    tours = tours.where(check_in_m: options['check_in_m'], check_in_y: options['check_in_y']) if options['check_in_m'] and options['check_in_y']
    tours = tours.where(tour_style: options['tour_style']) if options['tour_style']
    tours = tours.where(accommodation: options['accommodation']) if options['accommodation']
    tours = tours.where(price: options['cost']) if options['cost']
    if options['age_group']
      tours = tours.includes(:user_owners)
        .where(tour_user_assignments: { id: Tour::Owner.first_owners_by_tour })
        .where(users: { birthday: options['age_group'] })
    end
    tours = tours.includes(:resorts).where(resorts: { id: options['resorts'] }) if options['resorts']
    tours = tours.switched_on if options['show_passed'] == "0"
    tours
  end

  private

  def self.use_relative_model_naming?
    true
  end

  def country_presence
    errors.add(:base, :missing_country) if self.countries.empty?
  end
end
