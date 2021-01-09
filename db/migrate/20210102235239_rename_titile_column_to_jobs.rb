class RenameTitileColumnToJobs < ActiveRecord::Migration[5.2]
  def change
    rename_column :jobs, :titile, :title
  end
end
