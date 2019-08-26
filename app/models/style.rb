class Style < ApplicationRecord
  has_many :user_styles

  validates :name, presence: true
end
