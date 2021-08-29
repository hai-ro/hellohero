class NursingHomeMessage < ApplicationRecord
  # アソシエーション
  belongs_to :room
  belongs_to :nursing_home
end
