class Review < ApplicationRecord
  belongs_to :user
  belongs_to :reviewable, polymorphic: true
  validates_with ReviewValidator

  scope :from_item_by_user_id, -> (user_id) {
    joins("JOIN items on items.id = reviewable_id").where("reviewable_type = 'Item' and items.user_id = #{user_id} " )
  }
end
