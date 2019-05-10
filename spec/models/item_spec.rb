require 'rails_helper'

RSpec.describe Item, type: :model do
  let!(:city1) { create(:city) }
  let!(:city2) { create(:city) }

  let!(:user1) { create(:user, city: city1) }
  let!(:user2) { create(:user, city: city2) }
  let!(:item1) { create(:item, user: user1) }
  let!(:item2) { create(:item, user: user1) }
  let!(:item3) { create(:item, user: user1) }
  let!(:item4) { create(:item, user: user2) }

  it "is items reviews valid" do
    expect(described_class.by_city_id(city1.id)).to eq([item1, item2, item3])
  end
end
