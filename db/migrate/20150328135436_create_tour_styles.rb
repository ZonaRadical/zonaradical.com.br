class CreateTourStyles < ActiveRecord::Migration
  def change
    create_table :tour_styles do |t|
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
