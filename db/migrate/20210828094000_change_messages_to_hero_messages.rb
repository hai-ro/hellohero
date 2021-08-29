class ChangeMessagesToHeroMessages < ActiveRecord::Migration[5.2]
  def change
    rename_table :messages, :hero_messages
  end
end
