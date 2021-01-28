class AddQualificationsToHeros < ActiveRecord::Migration[5.2]
  def change
    add_column :heros, :initial_training, :integer # 介護初任者研修
    add_column :heros, :practical_training, :integer # 実務者研修
    add_column :heros, :social_worker, :integer # 社会福祉士
    add_column :heros, :care_manager, :integer # 介護支援専門員（ケアマネジャー）
    add_column :heros, :care_worker, :integer # 介護福祉士
    add_column :heros, :mhwp, :integer # 精神保健福祉士
    add_column :heros, :csdw, :integer #福祉用専門相談員
    add_column :heros, :interventional_services, :integer #介護事務
    add_column :heros, :whec, :integer #福祉環境コーディネーター
    add_column :heros, :dementia_care, :integer #認知症ケア
    add_column :heros, :confirmation, :integer #本人確認判定
  end
end
