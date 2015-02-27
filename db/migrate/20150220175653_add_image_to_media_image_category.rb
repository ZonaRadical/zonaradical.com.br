class AddImageToMediaImageCategory < ActiveRecord::Migration
  def change
    add_column :media_image_categories, :image, :string
  end
end
