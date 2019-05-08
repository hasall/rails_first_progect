class User < ApplicationRecord
  belongs_to :city
  has_many :item, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :reviews, as: :reviewable, dependent: :destroy
  #has_many :own_reviews, class: 'Review', dependent: :destroy
end
