class AddDetailToNursingHomes < ActiveRecord::Migration[5.2]
  def change
    add_column :nursing_homes, :detail, :text
  end
end
