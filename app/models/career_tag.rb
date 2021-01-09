class CareerTag < ApplicationRecord
  # アソシエーション
  has_many :tag_maps
end
