class CreateResorts < ActiveRecord::Migration
  def change
    create_table :resorts do |t|
      t.string :name
      t.string :image
      t.string :web
      t.string :fb
      t.integer :resort_category_id, :index
      t.text :level1_description
      t.text :level2_description
      t.text :level3_description
      t.integer :airport
      t.integer :altitude_top
      t.integer :altitude_bottom
      t.integer :drop
      t.integer :terrain
      t.integer :lifts
      t.string :slopes

      t.timestamps
    end
  end
end
