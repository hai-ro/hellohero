class HeroMessage < ApplicationRecord
  # アソシエーション
  belongs_to :hero
  belongs_to :room
end
