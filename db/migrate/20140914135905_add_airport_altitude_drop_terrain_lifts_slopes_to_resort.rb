class AddAirportAltitudeDropTerrainLiftsSlopesToResort < ActiveRecord::Migration
  def change
    add_column :resorts, :airport, :integer
    add_column :resorts, :altitude_top, :integer
    add_column :resorts, :altitude_bottom, :integer
    add_column :resorts, :drop, :integer
    add_column :resorts, :terrain, :integer
    add_column :resorts, :lifts, :integer
    add_column :resorts, :slopes, :string
  end
end
