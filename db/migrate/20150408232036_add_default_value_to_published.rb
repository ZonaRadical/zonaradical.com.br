class AddDefaultValueToPublished < ActiveRecord::Migration
  def up
    change_column :tours, :published, :boolean, default: true
  end

  def down
    change_column :tours, :published, :boolean, default: nil
  end
end
