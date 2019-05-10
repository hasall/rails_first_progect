# frozen_string_literal: true

FactoryBot.define do

  factory :city do
    name { 'test' }
  end

  factory :user do
    name { 'test' }
    association :city
  end

  factory :item do
    name { 'item test' }
    association :user
  end

  factory :booking do
    date_from { '01-01-2000, 01:02:03' }
    date_to   { '02-01-2000, 01:02:03' }
    association :item
    association :user
  end

  factory :review do
    message { 'textitem1' }
    association :user
    reviewable_type { 'Item' }
    reviewable_id { 1 }
  end

end
