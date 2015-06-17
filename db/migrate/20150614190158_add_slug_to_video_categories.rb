class AddSlugToVideoCategories < ActiveRecord::Migration
  def change
    add_column :video_categories, :slug, :string
  end
end
