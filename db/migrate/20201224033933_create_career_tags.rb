class CreateCareerTags < ActiveRecord::Migration[5.2]
  def change
    create_table :career_tags do |t|
      t.string :name
      t.integer :certification
      t.timestamps
    end
  end
end
