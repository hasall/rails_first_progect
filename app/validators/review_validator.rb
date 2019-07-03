class ReviewValidator < ActiveModel::Validator
  def validate(record)
    user = record.user_id
    reviewable_type = record.reviewable_type
    reviewable_id = record.reviewable_id

    if reviewable_type == 'Item' # Якщо ми даємо відгук для предмета
      # Ми знаходимо усі записи бронювань де той хто пише відгук є тим хто бронював цей предмет
      bookings = Booking.where(user_id: user, item_id: reviewable_id)
      record.errors[:user] << 'did not book this item' if bookings.empty?
    else # reviewable_type = "User"
      # Ми знаходимо усі записи бронювань де той хто пише відгук є тим хто бронював будь який предмет цієї людини
      bookings = Booking.joins(:item).where(items: { user_id: reviewable_id }, bookings: { user_id: user } )
      record.errors[:user] << 'did not book any item in a reviewable user' if bookings.empty?
    end
  end
end
