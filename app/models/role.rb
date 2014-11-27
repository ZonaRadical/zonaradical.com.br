# create_table :roles, force: true do |t|
#   t.string :name
# end

class Role < ActiveRecord::Base
  has_many :role_assignments
  has_many :users, :through => :role_assignments
end
