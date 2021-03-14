class ChangedataimageToJobs < ActiveRecord::Migration[5.2]
  def change
    change_column :jobs, :image, :string
  end
end
