require 'rails_helper'

RSpec.feature 'PurchasesIndices', type: :feature do
  before(:each) do
    @user = create(:user, password: 'password123', password_confirmation: 'password123')
    @group = create(:group, user_id: @user.id)
    login_as(@user, scope: :user)
    visit group_purchases_path(@group)
  end

  it 'has the text Purchases' do
    expect(page).to have_content('Purchases')
  end

  it 'has the text Add Purchase' do
    expect(page).to have_content('Add Purchase')
  end

  it 'has the purchase name' do
    expect(page).to have_content('No purchases yet.')
  end
end
