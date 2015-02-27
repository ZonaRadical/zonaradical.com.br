class AddImageToVideoCategory < ActiveRecord::Migration
  def change
    add_column :video_categories, :image, :string
  end
end
