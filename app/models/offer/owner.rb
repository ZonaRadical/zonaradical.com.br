# create_table :tour_user_assignments, force: true do |t|
#   t.integer :tour_id
#   t.integer :user_id
# end
#
# add_index :tour_user_assignments, [:tour_id], name: :index_tour_user_assignments_on_tour_id, using: :btree
# add_index :tour_user_assignments, [:user_id], name: :index_tour_user_assignments_on_user_id, using: :btree

class Offer::Owner < ActiveRecord::Base
  self.table_name = 'offer_user_assignments'

  belongs_to :offer
  belongs_to :user

  def self.first_owners_by_tour
    Offer::Owner.where(id: Offer::Owner.group(:tour_id).minimum(:id).values)
  end
end
