class MyValidator < ActiveModel::Validator
  def validate(record)
    user = record.user_id #Користувач який залишає відгук
    reviewable_type = record.reviewable_type
    reviewable_id = record.reviewable_id 

    if reviewable_type = "Item" #Якщо ми даємо відгук для предмета
      #Ми знаходимо усі записи бронювань де той хто пише відгук є тим хто бронював цей предмет
      p = Booking.where("user_id = '#{user}' and item_id = '#{reviewable_id}'")
      record.errors[:base] << "You didnt book this item" if p.empty?
    else #reviewable_type = "User"
      #Ми знаходимо усі записи бронювань де той хто пише відгук є тим хто бронював будь який предмет цієї людини
      p = Booking.joins(:item).where("items.user_id = '#{reviewable_id}' and user_id = '#{user}'")
      record.errors[:base] << "You didnt book any item this user" if p.empty?
    end
  end
end

class Review < ApplicationRecord
  belongs_to :user
  belongs_to :reviewable, polymorphic: true

  validates_with MyValidator

  scope :from_item_by_user_id, ->(user_id) {
    joins("JOIN items on items.id = reviewable_id JOIN users on items.user_id = users.id").where("reviewable_type = 'Item' and users.id = '#{user_id}'")
  }
end
