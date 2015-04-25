class AddSwitchOffAndCheckInAlsoAsDateInTour < ActiveRecord::Migration
  def up
    add_column :tours, :check_in, :date
    add_column :tours, :switch_off, :date

    Tour.reset_column_information

    # Update all tours, so the before_save callback is called to update check_in
    # and switch_off fields
    Tour.all.each { |t| t.update_attribute(:updated_at, Time.now) }
  end

  def down
    remove_column :tours, :check_in
    remove_column :tours, :switch_off
  end
end
