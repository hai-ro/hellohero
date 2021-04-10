class ChangeDataPhoneNursingHomes < ActiveRecord::Migration[5.2]
  def change
    change_column :nursing_homes, :phone, :string
  end
end
