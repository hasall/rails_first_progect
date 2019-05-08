class Booking < ApplicationRecord
  belongs_to :item
  belongs_to :user
  scope :by_user, ->(user_name) {
    joins("JOIN items on items.id = reviewable_id", item: :user).where(reviewable_type: "Item", "user")
  }

end
