class AddProfileSettingsToUser < ActiveRecord::Migration
  def change
    add_column :users, :surname, :string
    add_column :users, :login, :string, unique: true
    add_column :users, :sex, :string
    add_column :users, :birthday, :date
    add_column :users, :country, :string
    add_column :users, :city, :string
    add_column :users, :web, :string
    add_column :users, :fb, :string
    add_column :users, :bio, :text
  end
end
