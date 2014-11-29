class AddUrlAndNameToGalleryImages < ActiveRecord::Migration
  def change
    add_column :gallery_images, :name, :string
    add_column :gallery_images, :url, :string
  end
end
