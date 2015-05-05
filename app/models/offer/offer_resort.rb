# create_table :offer_resort_assignments, force: true do |t|
#   t.integer :offer_id
#   t.integer :resort_id
# end
#
# add_index :offer_resort_assignments, [:offer_id], name: :index_offer_resort_assignments_on_offer_id, using: :btree
# add_index :offer_resort_assignments, [:resort_id], name: :index_offer_resort_assignments_on_resort_id, using: :btree

class Offer::OfferResort < ActiveRecord::Base
  self.table_name = 'offer_resort_assignments'

  belongs_to :offer
  belongs_to :resort
end
