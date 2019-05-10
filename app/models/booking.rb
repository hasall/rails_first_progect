class Booking < ApplicationRecord
  belongs_to :item
  belongs_to :user
  validates_associated :item
  validates_associated :user
end
