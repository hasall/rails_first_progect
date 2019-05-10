require 'rails_helper'

RSpec.describe Review, type: :model do
  let!(:city2) { create(:city) }
  let!(:city1) { create(:city) }

  let!(:user1) { create(:user, city: city1) }
  let!(:user2) { create(:user, city: city2) }
  let!(:user3) { create(:user, city: city2) }

  let!(:item1) { create(:item, user: user1) }
  let!(:item2) { create(:item, user: user1) }
  let!(:item3) { create(:item, user: user1) }
  let!(:item4) { create(:item, user: user2) }

  let!(:booking1) { create(:booking, item: item1,  user: user2) }
  let!(:booking2) { create(:booking, item: item2,  user: user2) }
  let!(:booking3) { create(:booking, item: item3,  user: user2) }
  let!(:booking4) { create(:booking, item: item4,  user: user1) }

  let!(:review1) { create(:review, reviewable: item1, reviewable_type: 'Item', user: user2) }
  let!(:review2) { build(:review, reviewable: item1, reviewable_type: 'Item', user: user1) }
  let!(:review3) { build(:review, reviewable: user3, reviewable_type: 'User', user: user1) }

  let!(:review4) { create(:review, reviewable: item1, reviewable_type: 'Item', user: user2) }
  let!(:review5) { create(:review, reviewable: item2, reviewable_type: 'Item', user: user2) }
  let!(:review6) { create(:review, reviewable: item3, reviewable_type: 'Item', user: user2) }
  let!(:review7) { create(:review, reviewable: item4, reviewable_type: 'Item', user: user1) }

  it "reviews valid" do

    expect(review1).to be_valid

    expect(review2).to_not be_valid
    expect(review2.errors[:base]).to eq(['You didnt book this item'])

    expect(review3).to_not be_valid
    expect(review3.errors[:base]).to eq(['You didnt book any item this user'])
  end

  it "all review for item specific user" do
    #Review.from_item_by_user_id(1)
    expect(described_class.from_item_by_user_id(user2.id)).to eq( [review7] )
    expect(described_class.from_item_by_user_id(user1.id)).to eq( [review1, review4, review5, review6] )
  end
end
