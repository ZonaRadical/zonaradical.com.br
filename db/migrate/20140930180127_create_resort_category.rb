class CreateResortCategory < ActiveRecord::Migration
  def change
    create_table :resort_categories do |t|
      t.string :name
      t.integer :parent_id, :index
      t.text :description

      t.timestamp
    end
  end
end
