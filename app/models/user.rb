class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :articles

  has_many :followerships, class_name: 'Followership', foreign_key: 'user_id'
  has_many :followings, through: :followerships, class_name: 'User', foreign_key: 'following_id'

  has_many :inverse_followerships, class_name: 'Followership', foreign_key: 'following_id'
  has_many :followers, through: :inverse_followerships, class_name: 'User', source: :user
end