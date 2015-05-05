# create_table :offer_country_assignments, force: true do |t|
#   t.integer :offer_id
#   t.integer :resort_category_id
# end
#
# add_index :offer_country_assignments, [:offer_id], name: :index_offer_country_assignments_on_offer_id, using: :btree
# add_index :offer_country_assignments, [:resort_category_id], name: :index_offer_country_assignments_on_resort_category_id, using: :btree

class Offer::Country < ActiveRecord::Base
  self.table_name = 'offer_country_assignments'

  belongs_to :offer
  belongs_to :resort_category
end
