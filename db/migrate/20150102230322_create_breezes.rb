class CreateBreezes < ActiveRecord::Migration
  def change
    create_table :breezes do |t|
      t.string :title
      t.text :body
      t.string :url
      t.string :image
      t.integer :breeze_category_id

      t.timestamps
    end
  end
end
