class CreateTagMaps < ActiveRecord::Migration[5.2]
  def change
    create_table :tag_maps do |t|
      t.integer :hero_id
      t.integer :career_tag_id
      t.timestamps
    end
  end
end
