# create_table :role_assignments, force: true do |t|
#   t.integer :user_id
#   t.integer :role_id
# end

class RoleAssignment < ActiveRecord::Base
  belongs_to :user
  belongs_to :role
end
