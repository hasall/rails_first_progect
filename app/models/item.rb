class Item < ApplicationRecord
  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_many :bookings, dependent: :destroy

  scope :by_city, ->(city_id) {
    joins(:users).where("ussers.id = '#{city_id}'")
  }

end
