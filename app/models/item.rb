class Item < ApplicationRecord
  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_many :bookings, dependent: :destroy

  scope :by_city_id, ->(city_id) {
    joins(:user).where("users.city_id = '#{city_id}'")
  }

end
