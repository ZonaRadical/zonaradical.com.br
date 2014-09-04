class CreateResorts < ActiveRecord::Migration
  def change
    create_table :resorts do |t|
      t.string :name
      t.string :image
      t.string :link
      t.string :link_to_map
      t.string :country_code
      t.text :level1_description
      t.text :level2_description
      t.text :level3_description

      t.timestamps
    end
  end
end
