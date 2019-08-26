class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :events
  has_many :user_participations

  has_many :user_styles, dependent: :destroy
  has_many :styles, through: :user_styles

  validates :username, uniqueness: true

  acts_as_voter
end
