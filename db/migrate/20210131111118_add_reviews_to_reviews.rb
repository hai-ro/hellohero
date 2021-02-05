class AddReviewsToReviews < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :behavior, :integer
    add_column :reviews, :smile, :integer
    add_column :reviews, :cleaniless, :integer
    add_column :reviews, :politeness, :integer
    add_column :reviews, :physical, :integer
  end
end
