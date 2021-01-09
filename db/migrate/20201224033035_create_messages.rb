class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.text :message
      t.integer :room_id
      t.integer :helper_id
      t.timestamps
    end
  end
end
