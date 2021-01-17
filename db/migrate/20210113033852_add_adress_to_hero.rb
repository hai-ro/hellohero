class AddAdressToHero < ActiveRecord::Migration[5.2]
  def change
    add_column :heros, :address, :string
  end
end
