class CreateGalleryImages < ActiveRecord::Migration
  def change
    create_table :gallery_images do |t|
      t.belongs_to :resort
      t.string :image
      t.text :description
      t.integer :gallerable_id
      t.string  :gallerable_type

      t.timestamps
    end
  end
end
