class CreateOffers < ActiveRecord::Migration
  def change
    create_table :offers do |t|
      t.references :tour_style, index: true
      t.references :accommodation, index: true
      t.string :title
      t.text :description
      t.string :whats_included
      t.integer :duration
      t.integer :check_in_d
      t.integer :check_in_m
      t.integer :check_in_y
      t.integer :switch_off_d
      t.integer :switch_off_m
      t.integer :switch_off_y
      t.date :check_in
      t.date :switch_off
      t.string :image
      t.decimal :price, precision: 5, scale: 0
      t.boolean :published, default: true

      t.timestamps
    end
  end
end
