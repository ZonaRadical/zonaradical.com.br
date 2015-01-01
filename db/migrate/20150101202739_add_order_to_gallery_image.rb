class AddOrderToGalleryImage < ActiveRecord::Migration
  def change
    add_column :gallery_images, :order, :integer
  end
end
