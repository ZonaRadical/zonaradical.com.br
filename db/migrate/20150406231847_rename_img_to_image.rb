class RenameImgToImage < ActiveRecord::Migration
  def change
    rename_column :tours, :img, :image
  end
end
