# create_table :offer_user_assignments, force: true do |t|
#   t.integer :offer_id
#   t.integer :user_id
# end
#
# add_index :offer_user_assignments, [:offer_id], name: :index_offer_user_assignments_on_offer_id, using: :btree
# add_index :offer_user_assignments, [:user_id], name: :index_offer_user_assignments_on_user_id, using: :btree

class Offer::Owner < ActiveRecord::Base
  self.table_name = 'offer_user_assignments'

  belongs_to :offer
  belongs_to :user

  def self.first_owners_by_tour
    Offer::Owner.where(id: Offer::Owner.group(:tour_id).minimum(:id).values)
  end
end
