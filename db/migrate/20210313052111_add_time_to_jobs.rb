class AddTimeToJobs < ActiveRecord::Migration[5.2]
  def change
    add_column :jobs, :time, :integer
  end
end
