class ChangeDatatypeTimeOfJobs < ActiveRecord::Migration[5.2]
  def change
    change_column :jobs, :time, :float
  end
end
