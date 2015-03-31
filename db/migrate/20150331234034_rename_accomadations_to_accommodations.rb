class RenameAccomadationsToAccommodations < ActiveRecord::Migration
  def change
    rename_table :accomadations, :accommodations
  end
end
