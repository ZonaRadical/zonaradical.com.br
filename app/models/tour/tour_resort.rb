# create_table :tour_resort_assignments, force: true do |t|
#   t.integer :tour_id
#   t.integer :resort_id
# end
#
# add_index :tour_resort_assignments, [:resort_id], name: :index_tour_resort_assignments_on_resort_id, using: :btree
# add_index :tour_resort_assignments, [:tour_id], name: :index_tour_resort_assignments_on_tour_id, using: :btree

class Tour::TourResort < ActiveRecord::Base
  self.table_name = 'tour_resort_assignments'

  belongs_to :tour
  belongs_to :resort
end
