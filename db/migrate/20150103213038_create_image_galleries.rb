class CreateImageGalleries < ActiveRecord::Migration
  def change
    create_table :image_galleries do |t|
      t.string :title
      t.text :description
      t.integer :media_image_category_id

      t.timestamps
    end
  end
end
