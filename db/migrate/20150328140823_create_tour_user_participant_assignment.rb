class CreateTourUserParticipantAssignment < ActiveRecord::Migration
  def change
    create_table :tour_user_participant_assignments do |t|
      t.references :tour, index: true
      t.references :user, index: true
    end
  end
end
