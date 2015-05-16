# create_table :tour_country_assignments, force: true do |t|
#   t.integer :tour_id
#   t.integer :resort_category_id
# end
#
# add_index :tour_country_assignments, [:resort_category_id], name: :index_tour_country_assignments_on_resort_category_id, using: :btree
# add_index :tour_country_assignments, [:tour_id], name: :index_tour_country_assignments_on_tour_id, using: :btree

class Tour::Country < ActiveRecord::Base
  self.table_name = 'tour_country_assignments'

  belongs_to :tour
  belongs_to :resort_category
end
