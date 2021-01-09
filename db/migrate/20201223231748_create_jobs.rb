class CreateJobs < ActiveRecord::Migration[5.2]
  def change
    create_table :jobs do |t|
      t.string :titile
      t.integer :price
      t.text :service
      t.text :expect
      t.integer :nursing_home_id
      t.integer :client_id
      t.integer :job_category_id
      t.datetime :start_datetime
      t.datetime :end_datetime
      t.timestamps
    end
  end
end
