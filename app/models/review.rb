class Review < ApplicationRecord
  # アソシエーション
  belongs_to :nursing_home
  belongs_to :job
end
