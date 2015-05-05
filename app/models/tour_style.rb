# create_table :tour_styles, force: true do |t|
#   t.string   :name
#   t.string   :description
#   t.datetime :created_at
#   t.datetime :updated_at
# end

class TourStyle < ActiveRecord::Base
  def to_s
    name
  end
end
