class MyValidator < ActiveModel::Validator
  def validate(record)
    user = record.user_id
    reviewable_type = record.reviewable_type
    reviewable_id = record.reviewable_id

    if reviewable_type = "Item" && !Booking.where("user_id = '#{user}' and reviewable_id = '#{reviewable_id}'")
      record.errors[:base] << "You didnt book this item"
    elseif reviewable_type = "User" && Booking.joins(item: :user).where("users.id = '#{reviewable_id}'")
      record.errors[:base] << "You didnt book any item this user"
    end
    #record.errors[:base] << "This person is evil"
  end
end

class Review < ApplicationRecord
  belongs_to :user
  belongs_to :reviewable, polymorphic: true
  validates_with MyValidator
end
