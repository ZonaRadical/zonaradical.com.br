class CreateTourUserAssignment < ActiveRecord::Migration
  def change
    create_table :tour_user_assignments do |t|
      t.references :tour, index: true
      t.references :user, index: true
    end
  end
end
