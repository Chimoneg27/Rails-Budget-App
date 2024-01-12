require 'rails_helper'

RSpec.describe Group, type: :model do
  it 'is not valid without a name' do
    expect(FactoryBot.build(:group, name: nil)).not_to be_valid
  end

  it 'is not valid without an amount' do
    expect(FactoryBot.build(:group, amount: nil)).not_to be_valid
  end

  it 'is valid with a name' do
    user = FactoryBot.create(:user, password: 'password123')
    expect(FactoryBot.build(:group, name: 'group1', user: user)).to be_valid
  end

  it 'is valid with an amount' do
    user = FactoryBot.create(:user, password: 'password123')
    expect(FactoryBot.build(:group, amount: 1000, user: user)).to be_valid
  end

  # it is not valid without an icon
  it 'is not valid without an icon' do
    user = FactoryBot.create(:user, password: 'password123')
    expect(FactoryBot.build(:group, icon: nil, user: user)).not_to be_valid
  end
end
