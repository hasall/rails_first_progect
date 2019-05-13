require 'rails_helper'

RSpec.describe Item, type: :model do
  let!(:item1) { create(:item) }
  let!(:item2) { create(:item) }

  describe '.by_city_id' do
    it 'is items reviews valid' do
      expect(described_class.by_city_id(item1.user.city.id)).to eq([item1])
    end
  end
end
