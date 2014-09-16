class AddParentIdToCountry < ActiveRecord::Migration
  def change
    add_column :countries, :parent_id, :integer, index: true
  end
end