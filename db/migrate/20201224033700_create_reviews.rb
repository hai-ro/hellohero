class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.text :text
      t.integer :nursing_home_id
      t.integer :hero_id
      t.integer :job_id
      t.timestamps
    end
  end
end
