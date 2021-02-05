class ChangeDataPerformanceToHeros < ActiveRecord::Migration[5.2]
  def change
    change_column :heros, :performance, :integer
  end
end
