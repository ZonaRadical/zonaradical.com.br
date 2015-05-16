class AddStatusToOfferUserParticipantAssignments < ActiveRecord::Migration
  def change
    add_column :offer_user_participant_assignments, :status, :integer, default: 0
  end
end
