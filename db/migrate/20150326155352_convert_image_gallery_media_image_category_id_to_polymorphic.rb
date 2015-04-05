class ConvertImageGalleryMediaImageCategoryIdToPolymorphic < ActiveRecord::Migration
  def up
  	rename_column :image_galleries, :media_image_category_id, :image_gallerable_id
  	add_column :image_galleries, :image_gallerable_type, :string
  	add_index :image_galleries, [:image_gallerable_id, :image_gallerable_type], name: 'index_image_gallerable_polymorphic'

  	ImageGallery.reset_column_information
  	ImageGallery.update_all(image_gallerable_type: 'MediaImageCategory')
  end

  def down
  	remove_index :image_galleries, [:image_gallerable_id, :image_gallerable_type]
  	remove_column :image_galleries, :image_gallerable_type
  	rename_column :image_galleries, :image_gallerable_id, :media_image_category_id
  end
end
