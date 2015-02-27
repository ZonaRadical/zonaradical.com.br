class AddImageToResortCategory < ActiveRecord::Migration
  def change
    add_column :resort_categories, :image, :string
  end
end
