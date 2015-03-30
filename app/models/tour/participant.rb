class Tour::Participant < ActiveRecord::Base
  self.table_name = 'tour_user_participant_assignments'

  belongs_to :tour
  belongs_to :user
end