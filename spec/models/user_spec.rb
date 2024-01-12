require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is not valid without a name' do
    expect(FactoryBot.build(:user, name: nil)).not_to be_valid
  end

  it 'is not valid without an email' do
    expect(FactoryBot.build(:user, email: nil)).not_to be_valid
  end

  it 'is valid with a name' do
    expect(FactoryBot.build(:user, password: 'password123')).to be_valid
  end

  it 'is valid with an email' do
    expect(FactoryBot.build(:user, password: 'password123')).to be_valid
  end
end
