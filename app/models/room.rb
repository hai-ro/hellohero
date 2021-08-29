class Room < ApplicationRecord
  belongs_to :hero
  belongs_to :nursung_home
  has_many :hero_messages
  has_many :nursing_home_messages
end
