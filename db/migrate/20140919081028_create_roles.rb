class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :name
      t.timestamp
    end
    create_table :role_assignments do |t|
      t.belongs_to :user
      t.belongs_to :role
      t.timestamp
    end
  end
end