class AddStopToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :stop, :integer
  end
end
