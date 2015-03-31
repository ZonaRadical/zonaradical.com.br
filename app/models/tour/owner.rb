# create_table :tour_user_assignments, force: true do |t|
#   t.integer :tour_id
#   t.integer :user_id
# end
#
# add_index :tour_user_assignments, [:tour_id], name: :index_tour_user_assignments_on_tour_id, using: :btree
# add_index :tour_user_assignments, [:user_id], name: :index_tour_user_assignments_on_user_id, using: :btree

class Tour::Owner < ActiveRecord::Base
  self.table_name = 'tour_user_assignments'

  belongs_to :tour
  belongs_to :user
end
