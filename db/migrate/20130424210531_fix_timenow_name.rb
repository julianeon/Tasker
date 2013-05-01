class FixTimenowName < ActiveRecord::Migration
  def up
    rename_column :tasks, :timenow, :start
  end

  def down
  end
end
