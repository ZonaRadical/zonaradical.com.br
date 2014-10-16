class AddAncestryCacheToResortCategories < ActiveRecord::Migration
  def change
    add_column :resort_categories, :ancestry_depth, :integer, default: 0
  end
end
