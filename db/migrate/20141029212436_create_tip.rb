class CreateTip < ActiveRecord::Migration
  def change
    create_table :tips do |t|
      t.string :title
      t.text :body
      t.integer :tip_category_id
      t.string :image

      t.timestamps
    end
  end
end
