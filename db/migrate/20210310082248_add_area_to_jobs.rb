class AddAreaToJobs < ActiveRecord::Migration[5.2]
  def change
    add_column :jobs, :area, :string
    add_column :jobs, :image, :text
  end
end
