class AddImageToTipCategory < ActiveRecord::Migration
  def change
    add_column :tip_categories, :image, :string
  end
end
