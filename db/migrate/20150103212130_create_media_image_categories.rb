class CreateMediaImageCategories < ActiveRecord::Migration
  def change
    create_table :media_image_categories do |t|
      t.string :name
      t.text :description
      t.string :ancestry, :index
      t.integer :ancestry_depth, default: 0

      t.timestamps
    end
  end
end
