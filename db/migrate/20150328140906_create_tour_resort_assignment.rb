class CreateTourResortAssignment < ActiveRecord::Migration
  def change
    create_table :tour_resort_assignments do |t|
      t.references :tour, index: true
      t.references :resort, index: true
    end
  end
end
