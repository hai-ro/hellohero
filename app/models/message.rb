class Message < ApplicationRecord
  # アソシエーション
  belongs_to :hero
  belongs_to :room
  belongs_to :nursing_home
end
