class RemoveEndDatetimeToJobs < ActiveRecord::Migration[5.2]
  def change
    remove_column :jobs, :end_datetime, :datetime
  end
end
