class CreateResortGalleryImages < ActiveRecord::Migration
  def change
    create_table :resort_gallery_images do |t|
      t.belongs_to :resort
      t.string :image
      t.text :description

      t.timestamps
    end
  end
end
