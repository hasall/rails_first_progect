require('MyValidator_validator')

class Review < ApplicationRecord
  belongs_to :user
  belongs_to :reviewable, polymorphic: true
  #belongs_to :item, -> { where( reviews: { reviewable_type: "Item" } ).joins(:reviews) }, foreing_key: 'reviewable_id'
  validates_with MyValidator
  validates_associated :user
  validates :reviewable_id, presence: true
  validates :reviewable_type, inclusion: { in: %w(Item User),
    message: "%{value} is not a valid size" }

  scope :from_item_by_user_id, ->(user_id) {
    joins("JOIN items on items.id = reviewable_id").where("reviewable_type = 'Item' and items.user_id = #{user_id} " )
    #joins(item: {reviewable_id: :id} :user).where(reviewable_type: 'Item', item: {user_id: '#{user_id}'})
  }



end
