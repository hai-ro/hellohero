class NursingHome < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  
  # アソシエーション
  has_many :jobs
  # belongs_to :type
  has_many :reviews
  has_many :nursing_home_messages
end
