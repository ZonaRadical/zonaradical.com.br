# create_table :accommodations, force: true do |t|
#   t.string   :name
#   t.datetime :created_at
#   t.datetime :updated_at
#   t.text     :description
# end

class Accommodation < ActiveRecord::Base
  def to_s
    name
  end
end
