class AddSlugToTipCategories < ActiveRecord::Migration
  def change
    add_column :tip_categories, :slug, :string
  end
end
