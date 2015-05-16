class CreateAccomadations < ActiveRecord::Migration
  def change
    create_table :accomadations do |t|
      t.string :name

      t.timestamps
    end
  end
end
