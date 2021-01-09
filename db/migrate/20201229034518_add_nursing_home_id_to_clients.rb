class AddNursingHomeIdToClients < ActiveRecord::Migration[5.2]
  def change
    add_column :clients, :nursing_home_id, :integer
  end
end
