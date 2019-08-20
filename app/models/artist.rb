class Artist < ApplicationRecord
  has_many :artist_participations

  validates :name, presence: true, uniqueness: true
  validates :category, presence: true
end
