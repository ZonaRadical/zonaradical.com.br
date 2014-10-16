class ChangeAirportColumnTypetoResorts < ActiveRecord::Migration
  def change
    change_column :resorts, :airport, :string
  end
end
