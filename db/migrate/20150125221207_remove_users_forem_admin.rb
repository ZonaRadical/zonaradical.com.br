class RemoveUsersForemAdmin < ActiveRecord::Migration
  def change
    remove_column :users, :forem_admin
  end
end