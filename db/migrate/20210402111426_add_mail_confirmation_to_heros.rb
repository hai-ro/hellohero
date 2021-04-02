class AddMailConfirmationToHeros < ActiveRecord::Migration[5.2]
  def change
    add_column :heros, :confirmation_token, :string
    add_column :heros, :confirmed_at, :datetime
    add_column :heros, :confirmation_sent_at, :datetime
    add_column :heros, :unconfirmed_email, :string # Only if using reconfirmable
  end
end
