class RemoveAncestryFromTipCategories < ActiveRecord::Migration
  def change
    remove_column :tip_categories, :ancestry, :ancestry_depth
  end
end
