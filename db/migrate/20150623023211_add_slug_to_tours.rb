class AddSlugToTours < ActiveRecord::Migration
  def change
    add_column :tours, :slug, :string
  end
end
