class AddFbAvatarToUsers < ActiveRecord::Migration
  def change
    add_column :users, :fb_avatar, :string
  end
end
