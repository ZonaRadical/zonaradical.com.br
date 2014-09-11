class AddCountryToResort < ActiveRecord::Migration
  def change
    add_column :resorts, :country_id, :integer
  end
end
