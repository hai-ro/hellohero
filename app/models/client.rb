class Client < ApplicationRecord
  # アソシエーション
  belongs_to :nursing_home
  has_many :jobs
end
