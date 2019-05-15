class Item < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :reviews, as: :reviewable, dependent: :destroy
  has_many :bookings, dependent: :destroy
  scope :by_city_id, ->(city_id) {
    joins(:user).where("users.city_id = '#{city_id}'")
  }
  # scope :all_reviews, ->(user_id) {
  #   p = where(user_id: user_id)
  #   p.reviews
  # }

  validates_associated :user

end
