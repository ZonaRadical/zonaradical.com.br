class CreateOfferUserParticipantAssignment < ActiveRecord::Migration
  def change
    create_table :offer_user_participant_assignments do |t|
      t.references :offer, index: true
      t.references :user, index: true
    end
  end
end
