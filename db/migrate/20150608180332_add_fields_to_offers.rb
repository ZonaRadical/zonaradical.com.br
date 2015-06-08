class AddFieldsToOffers < ActiveRecord::Migration
  def change
    add_column :offers, :hotel_name, :string
    add_column :offers, :air_included, :boolean
  end
end
