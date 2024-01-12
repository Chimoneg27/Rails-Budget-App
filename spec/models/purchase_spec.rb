require 'rails_helper'

RSpec.describe Purchase, type: :model do
  it 'is not valid without a name' do
    expect(FactoryBot.build(:purchase, name: nil)).not_to be_valid
  end

  it 'is not valid without an amount' do
    expect(FactoryBot.build(:purchase, amount: nil)).not_to be_valid
  end

  it 'is valid with a name' do
    user = FactoryBot.create(:user, password: 'password123')
    expect(FactoryBot.build(:purchase, name: 'purchase1', author: user)).to be_valid
  end

  it 'is valid with an amount' do
    user = FactoryBot.create(:user, password: 'password123')
    expect(FactoryBot.build(:purchase, amount: 1000, author: user)).to be_valid
  end
end
