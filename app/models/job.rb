class Job < ApplicationRecord
  # アソシエーション
  belongs_to :job_category
  belongs_to :nursing_home
  belongs_to :client
  belongs_to :hero
  has_many :reviews
  
  # #フォロー・フォロワー関係をあらわすアソシエーション
  # acts_as_followable
  # acts_as_follower
  
end
