class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :title
      t.text :description
      t.integer :source_cd
      t.integer :video_category_id
      t.string :source_link

      t.timestamps
    end
  end
end
