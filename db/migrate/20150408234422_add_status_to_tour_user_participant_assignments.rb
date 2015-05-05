class AddStatusToTourUserParticipantAssignments < ActiveRecord::Migration
  def change
    add_column :tour_user_participant_assignments, :status, :integer, default: 0
  end
end
