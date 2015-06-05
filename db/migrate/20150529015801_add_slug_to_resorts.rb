class AddSlugToResorts < ActiveRecord::Migration
  def change
    add_column :resorts, :slug, :string
  end
end
