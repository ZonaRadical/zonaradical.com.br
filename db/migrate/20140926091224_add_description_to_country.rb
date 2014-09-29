class AddDescriptionToCountry < ActiveRecord::Migration
  def up
    add_column :countries, :description, :text
    Country.add_translation_fields! description: :text
  end

  def down
    remove_column :country_translations, :description
  end
end
