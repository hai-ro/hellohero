class CreateClients < ActiveRecord::Migration[5.2]
  def change
    create_table :clients do |t|
      t.string :name
      t.date :birthday
      t.integer :gender
      t.string :disability
      t.string :like
      t.string :bad
      t.string :image
      t.string :area
      t.text :profile
      t.timestamps
    end
  end
end
