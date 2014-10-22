class AddShortDescriptionToResort < ActiveRecord::Migration
  def change
    add_column :resorts, :short_description, :text
  end
end
