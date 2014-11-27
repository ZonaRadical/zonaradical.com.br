# create_table :identities, force: true do |t|
#   t.integer  :user_id
#   t.string   :provider
#   t.string   :uid
#   t.datetime :created_at
#   t.datetime :updated_at
# end
#
# add_index :identities, [:user_id], name: :index_identities_on_user_id, using: :btree

class Identity < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :uid, :provider
  validates_uniqueness_of :uid, :scope => :provider

  def self.find_for_oauth(auth)
    identity = find_by(provider: auth.provider, uid: auth.uid)
    identity = create(uid: auth.uid, provider: auth.provider) if identity.nil?
    identity
  end
end
