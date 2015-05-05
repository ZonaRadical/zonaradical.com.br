class RenameAccomadationIdToAccommodationId < ActiveRecord::Migration
  def change
    rename_column :tours, :accomadation_id, :accommodation_id
  end
end
