class AddTimenowToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :timenow, :integer
  end
end
