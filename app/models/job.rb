class Job < ApplicationRecord
  # アソシエーション
  belongs_to :job_category
  belongs_to :nursing_home
  belongs_to :hero
  has_one :review
  
  # アップロード
  mount_uploader :image, ImageUploader
  
end
