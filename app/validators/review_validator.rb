class ReviewValidator < ActiveModel::Validator
  def validate(record)
    user = record.user_id
    reviewable_type = record.reviewable_type
    reviewable_id = record.reviewable_id

    record.errors[:base] << "Data errors" if user == nil
    record.errors[:base] << "Data errors" if reviewable_type != "Item" && reviewable_type != "User"
    record.errors[:base] << "Data errors" if reviewable_id == nil

    if reviewable_type == "Item" #Якщо ми даємо відгук для предмета
      #Ми знаходимо усі записи бронювань де той хто пише відгук є тим хто бронював цей предмет
      p = Booking.where("user_id = '#{user}' and item_id = '#{reviewable_id}'")
      record.errors[:base] << "You didnt book this item" if p.empty?
    else #reviewable_type = "User"
      #Ми знаходимо усі записи бронювань де той хто пише відгук є тим хто бронював будь який предмет цієї людини
      p = Booking.joins(:item).where("items.user_id = '#{reviewable_id}' and bookings.user_id = '#{user}'")
      record.errors[:base] << "You didnt book any item this user" if p.empty?
    end
  end
end
