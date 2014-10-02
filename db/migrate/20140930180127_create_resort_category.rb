class CreateResortCategory < ActiveRecord::Migration
  def change
    create_table :resort_categories do |t|
      t.string :name
      t.text :description
      t.string :ancestry, :index

      t.timestamp
    end
  end
end
