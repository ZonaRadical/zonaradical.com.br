class Tour::Owner < ActiveRecord::Base
  self.table_name = 'tour_user_assignments'

  belongs_to :tour
  belongs_to :user
end