class CreateTourCountryAssignment < ActiveRecord::Migration
  def change
    create_table :tour_country_assignments do |t|
      t.references :tour, index: true
      t.references :resort_category, index: true
    end
  end
end
