class Room < ApplicationRecord
  belongs_to :hero
  has_many :message
end
