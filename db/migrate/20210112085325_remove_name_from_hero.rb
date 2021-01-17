class RemoveNameFromHero < ActiveRecord::Migration[5.2]
  def change
    remove_column :heros, :name, :string
  end
end
