# create_table :offer_user_participant_assignments, force: true do |t|
#   t.integer :offer_id
#   t.integer :user_id
#   t.integer :status,   default: 0
# end
#
# add_index :offer_user_participant_assignments, [:offer_id], name: :index_offer_user_participant_assignments_on_offer_id, using: :btree
# add_index :offer_user_participant_assignments, [:user_id], name: :index_offer_user_participant_assignments_on_user_id, using: :btree

class Offer::Participant < ActiveRecord::Base
  self.table_name = 'offer_user_participant_assignments'

  belongs_to :offer
  belongs_to :user
  enum status: [:pending, :approved, :refused]

  validates :user_id, uniqueness: { scope: :offer_id }

  delegate :url_helpers, to: 'Rails.application.routes'
  delegate :helpers, to: 'ActionController::Base'

  def approve
    user.notify('Solicitação aprovada', "Sua participação na offer '#{offer.title}' foi aprovada.") if approved!
  end

  def refuse
    user.notify('Solicitação recusada', "Sua participação na offer '#{offer.title}' foi recusada.") if refused!
  end
end
