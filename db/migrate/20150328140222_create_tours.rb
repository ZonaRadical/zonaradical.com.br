class CreateTours < ActiveRecord::Migration
  def change
    create_table :tours do |t|
      t.references :tour_style, index: true
      t.references :accomadation, index: true
      t.string :title
      t.string :description
      t.string :whats_included
      t.integer :duration
      t.date :check_in
      t.date :switch_off
      t.string :img
      t.decimal :price, precision: 5, scale: 0
      t.boolean :published

      t.timestamps
    end
  end
end
