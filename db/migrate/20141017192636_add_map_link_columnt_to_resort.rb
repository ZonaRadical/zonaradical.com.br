class AddMapLinkColumntToResort < ActiveRecord::Migration
  def change
    add_column :resorts, :map_url, :string
  end
end
