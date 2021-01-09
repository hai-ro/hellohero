class AddProgressToJobs < ActiveRecord::Migration[5.2]
  def change
    add_column :jobs, :progress, :integer
    add_column :jobs, :hero_id, :integer
  end
end
