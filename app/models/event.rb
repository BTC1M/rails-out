class Event < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :place
  has_many :user_participations, dependent: :destroy
  has_many :artist_participations, dependent: :destroy
  has_many :users, through: :user_participations
  has_many :artists, through: :artist_participations

  validates :title, presence: true
  validates :category, presence: true # , acceptance: { accept: ['Concert', 'Festival', 'Bar', 'Club', 'Open air', 'Rooftop'] }
  validates :price, presence: true
  validates :date, presence: true
  validates :start_time, presence: true
end
