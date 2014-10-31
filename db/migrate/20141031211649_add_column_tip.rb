class AddColumnTip < ActiveRecord::Migration
  def change
    add_column :tips, :short_description, :string
    add_column :tips, :level2_description, :text
    add_column :tips, :level3_description, :text
    rename_column :tips, :body, :level1_description
  end
end
