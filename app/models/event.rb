class Event < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :place
end
