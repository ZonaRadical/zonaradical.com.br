class SplitCheckInAndSwitchOffDates < ActiveRecord::Migration
  def change
    add_column :tours, :check_in_d, :integer
    add_column :tours, :check_in_m, :integer
    add_column :tours, :check_in_y, :integer
    add_column :tours, :switch_off_d, :integer
    add_column :tours, :switch_off_m, :integer
    add_column :tours, :switch_off_y, :integer
    
    remove_column :tours, :check_in, :date
    remove_column :tours, :switch_off, :date
  end
end
