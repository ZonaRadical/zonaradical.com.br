class AddSlugToResortCategories < ActiveRecord::Migration
  def change
    add_column :resort_categories, :slug, :string
  end
end
