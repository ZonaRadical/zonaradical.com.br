# create_table :users, force: true do |t|
#   t.string   :email,                  default: "",               null: false
#   t.string   :encrypted_password,     default: "",               null: false
#   t.string   :reset_password_token
#   t.datetime :reset_password_sent_at
#   t.datetime :remember_created_at
#   t.integer  :sign_in_count,          default: 0,                null: false
#   t.datetime :current_sign_in_at
#   t.datetime :last_sign_in_at
#   t.string   :current_sign_in_ip
#   t.string   :last_sign_in_ip
#   t.string   :confirmation_token
#   t.datetime :confirmed_at
#   t.datetime :confirmation_sent_at
#   t.string   :unconfirmed_email
#   t.datetime :created_at
#   t.datetime :updated_at
#   t.string   :name
#   t.string   :forem_state,            default: :pending_review
#   t.boolean  :forem_auto_subscribe,   default: false
#   t.datetime :last_seen_at
#   t.string   :avatar
#   t.string   :surname
#   t.string   :login
#   t.string   :sex
#   t.date     :birthday
#   t.string   :country
#   t.string   :city
#   t.string   :web
#   t.string   :fb
#   t.text     :bio
#   t.string   :fb_avatar
#   t.string   :image
# end
#
# add_index :users, [:email], name: :index_users_on_email, unique: true, using: :btree
# add_index :users, [:reset_password_token], name: :index_users_on_reset_password_token, unique: true, using: :btree

class User < ActiveRecord::Base
  TEMP_EMAIL_PREFIX = 'change@me'
  TEMP_EMAIL_REGEX = /\Achange@me/

  # Include default devise modules. Others available are:
  # :lockable, :timeoutable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable
  acts_as_messageable
  has_many :role_assignments
  has_many :roles, :through => :role_assignments
  has_many :image_galleries, as: :image_gallerable
  has_and_belongs_to_many :tours, join_table: 'tour_user_assignments'
  has_and_belongs_to_many :offers, join_table: 'offer_user_assignments'

  mount_uploader :avatar, AvatarImageUploader
  mount_uploader :image, TipImageUploader

  validates_format_of :email, :without => TEMP_EMAIL_REGEX, on: :update
  validates_uniqueness_of :login, :allow_nil => true, :allow_blank => true

  validates :password, presence: true, length: {minimum: 5, maximum: 120}, on: :create
  validates :password, length: {minimum: 5, maximum: 120}, on: :update, allow_blank: true

  def self.find_for_oauth(auth, signed_in_resource = nil)

    # Get the identity and user if they exist
    identity = Identity.find_for_oauth(auth)
    # If a signed_in_resource is provided it always overrides the existing user
    # to prevent the identity being locked with accidentally created accounts.
    # Note that this may leave zombie accounts (with no associated identity) which
    # can be cleaned up at a later date.
    user = signed_in_resource ? signed_in_resource : identity.user
    # Create the user if needed
    if user.nil?

      # Get the existing user by email if the provider gives us a verified email.
      # If no verified email was provided we assign a temporary email and ask the
      # user to verify it on the next step via UsersController.finish_signup
      email_is_verified = auth.info.email && (auth.info.verified || auth.info.verified_email)
      email = auth.info.email if email_is_verified
      user = User.where(:email => email).first if email

      # Create the user if it's a new registration
      if user.nil?
        sex = auth.extra.raw_info.gender == 'male' ? 'M' : 'F'
        user = User.new(
            name: auth.extra.raw_info.first_name,
            surname:auth.extra.raw_info.last_name,
            sex: sex,
            fb: auth.extra.raw_info.link,
            fb_avatar: auth.info.image,
            #username: auth.info.nickname || auth.uid,
            email: email ? email : "#{TEMP_EMAIL_PREFIX}-#{auth.uid}-#{auth.provider}.com",
            password: Devise.friendly_token[0,20]
        )
        user.skip_confirmation!
        user.save!
      end
    end

    # Associate the identity with the user if needed
    if identity.user != user
      identity.user = user
      identity.save!
    end
    user
  end

  def self.athletes
    joins(:roles).where(roles: { name: 'athlete' }).order(name: :asc)
  end

  def self.agencies
    includes(:roles).where(roles: { name: 'agency' })
  end

  def self.organizations
    includes(:roles).where(roles: { name: 'organization' })
  end


  def email_verified?
    self.email && self.email !~ TEMP_EMAIL_REGEX
  end

  def online?
    self.last_seen_at.to_i - self.current_sign_in_at.to_i > 0
  end

  def has_role?(role_sym)
    roles.any? { |r| r.name.underscore.to_sym == role_sym }
  end

  def admin?
    roles.include?(Role.find_by_name(:admin))
  end

  def mailboxer_email(object)
    email
  end

  def notifications
    mailbox.notifications
  end
end
