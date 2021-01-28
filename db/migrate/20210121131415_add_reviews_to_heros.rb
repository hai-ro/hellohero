class AddReviewsToHeros < ActiveRecord::Migration[5.2]
  def change
    # add_column :heros, :behavior, :float # れいぎ
    # add_column :heros, :smile, :float # あかるさ
    # add_column :heros, :cleanliness, :float # せいけつさ
    # add_column :heros, :politeness, :float # ていねいさ
    # add_column :heros, :physical, :float # たいりょく
    add_column :heros, :eto, :string # 干支
  end
end
