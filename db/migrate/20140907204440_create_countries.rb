class CreateCountries < ActiveRecord::Migration
  def up
    create_table :countries do |t|
      t.string :name
      t.string :code
    end
    Country.create_translation_table! :name => :string
  end
  def down
    drop_table :countries
    Country.drop_translation_table!
  end
end
