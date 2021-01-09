class Review < ApplicationRecord
  # アソシエーション
  belongs_to :nursing_home
  belongs_to :job
  belongs_to :hero
end
