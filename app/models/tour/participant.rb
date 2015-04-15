# create_table :tour_user_participant_assignments, force: true do |t|
#   t.integer :tour_id
#   t.integer :user_id
#   t.integer :status,  default: 0
# end
#
# add_index :tour_user_participant_assignments, [:tour_id], name: :index_tour_user_participant_assignments_on_tour_id, using: :btree
# add_index :tour_user_participant_assignments, [:user_id], name: :index_tour_user_participant_assignments_on_user_id, using: :btree

class Tour::Participant < ActiveRecord::Base
  self.table_name = 'tour_user_participant_assignments'

  belongs_to :tour
  belongs_to :user
  enum status: [:pending, :approved, :refused]

  validates :user_id, uniqueness: { scope: :tour_id }

  delegate :url_helpers, to: 'Rails.application.routes'
  delegate :helpers, to: 'ActionController::Base'

  def approve
    user.notify('Solicitação aprovada', "Sua participação na tour '#{tour.title}' foi aprovada.") if approved!
  end

  def refuse
    user.notify('Solicitação recusada', "Sua participação na tour '#{tour.title}' foi recusada.") if refused!
  end
end
