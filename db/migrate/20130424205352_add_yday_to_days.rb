class AddYdayToDays < ActiveRecord::Migration
  def change
    add_column :days, :yday, :integer
  end
end 
