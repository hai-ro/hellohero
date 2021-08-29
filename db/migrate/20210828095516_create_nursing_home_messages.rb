class CreateNursingHomeMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :nursing_home_messages do |t|
      t.integer :nursing_home_id
      t.integer :room_id
      t.timestamps
    end
  end
end
