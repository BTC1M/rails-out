class Artist < ApplicationRecord
  has_many :artist_participations

  validates :name, presence: true, uniqueness: { scope: :name }
  validates :category, presence: true
end
