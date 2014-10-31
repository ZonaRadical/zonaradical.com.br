class RemoveColumnFromResort < ActiveRecord::Migration
  def change
    remove_column :resorts, :short_description, :string
  end
end
