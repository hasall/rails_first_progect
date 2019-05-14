require 'rails_helper'

RSpec.describe Review, type: :model do

  let!(:user1) { create(:user) }
  let!(:user2) { create(:user) }
  let!(:user3) { create(:user) }

  let!(:item1) { create(:item, user:user1) }
  let!(:item2) { create(:item, user:user2) }

  let!(:booking1) { create(:booking, item: item1,  user: user2) }
  let!(:booking2) { create(:booking, item: item2,  user: user1) }

  describe 'test validator' do
    let!(:review1) { create(:review, reviewable: item1, user: user2) }
    let!(:review2) { build(:review, reviewable: item1, user: user1) }
    let!(:review3) { build(:review, reviewable: user3, user: user1) }

    it 'reviews valid' do

      expect(review1).to be_valid
      expect(review2).to_not be_valid
      expect(review2.errors[:base]).to eq(['You didnt book this item'])

      expect(review3).to_not be_valid
      expect(review3.errors[:base]).to eq(['You didnt book any item this user'])
    end
  end
  describe '.from_item_by_user_id' do
    let!(:review1) { create(:review, reviewable: item1, user: user2) }
    let!(:review2) { create(:review, reviewable: item1, user: user2) }
    let!(:review3) { create(:review, reviewable: item2, user: user1) }

    it 'all review for item specific user' do
      expect(described_class.from_item_by_user_id(user2.id)).to eq( [review3] )
      expect(described_class.from_item_by_user_id(user1.id)).to eq( [review1, review2] )
    end
end
