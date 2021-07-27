class AddNamesToHeros < ActiveRecord::Migration[5.2]
  def change
    add_column :heros, :last_name, :string
    add_column :heros, :first_name, :string
    add_column :heros, :last_name_kana, :string
    add_column :heros, :first_name_kana, :string
  end
end
