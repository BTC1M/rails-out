class Place < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  has_many :events

  validates :name, presence: true
  validates :category, presence: true
  validates :reward, presence: true, numericality: { only_integer: true }
  validates :address, presence: true
end
