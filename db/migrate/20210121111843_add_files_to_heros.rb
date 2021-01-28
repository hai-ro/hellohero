class AddFilesToHeros < ActiveRecord::Migration[5.2]
  def change
    add_column :heros, :initial_training_file, :text # 介護初任者研修
    add_column :heros, :practical_training_file, :text # 実務者研修
    add_column :heros, :social_worker_file, :text # 社会福祉士
    add_column :heros, :care_manager_filename, :text # 介護支援専門員（ケアマネジャー）
    add_column :heros, :care_worker_file, :text # 介護福祉士
    add_column :heros, :mhwp_file, :text # 精神保健福祉士
    add_column :heros, :csdw_file, :text #福祉用専門相談員
    add_column :heros, :interventional_services_file, :text #介護事務
    add_column :heros, :whec_file, :text #福祉環境コーディネーター
    add_column :heros, :dementia_care_file, :text #認知症ケア
    add_column :heros, :confirmation_file, :text #本人確認判定
  end
end
