class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  attachment :profile_image

  validates :name, presence:true, length: {minimum: 2,maximum: 20 }
  validates :introduction, length: {maximum: 50 }

  has_many :books, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  # チャット機能
  has_many :user_rooms
  has_many :chats
  has_many :rooms, through: :user_rooms
  

end
