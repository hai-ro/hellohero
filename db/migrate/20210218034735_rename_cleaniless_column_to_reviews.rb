class RenameCleanilessColumnToReviews < ActiveRecord::Migration[5.2]
  def change
    rename_column :reviews, :cleaniless, :cleanliness
  end
end
