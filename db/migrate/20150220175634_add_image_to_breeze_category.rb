class AddImageToBreezeCategory < ActiveRecord::Migration
  def change
    add_column :breeze_categories, :image, :string
  end
end
