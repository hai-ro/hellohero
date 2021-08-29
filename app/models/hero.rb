class Hero < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  
  # アソシエーション
  has_many :reviews
  has_many :tag_maps
  has_many :hero_messages
  has_many :rooms
  has_many :jobs
  
  # 画像アップローダ設定
  mount_uploader :image, ImageUploader
end
