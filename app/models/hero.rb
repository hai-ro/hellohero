class Hero < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  # アソシエーション
  has_many :reviews
  has_many :tag_maps
  has_many :messages
  has_many :rooms
  has_many :jobs
  
  # # フォロー・フォロワー関係をあらわすアソシエーション
  # acts_as_followable
  # acts_as_follower
end
