require 'rails_helper'

RSpec.feature 'GroupsIndices', type: :feature do
  before(:each) do
    @user = create(:user, password: 'password123', password_confirmation: 'password123')
    @group = create(:group, user_id: @user.id)
    login_as(@user, scope: :user)
    visit groups_path
  end

  it 'has the text Groups' do
    expect(page).to have_content('Groups')
  end

  it 'has the text Add Group' do
    expect(page).to have_content('Add Group')
  end

  it 'has the group name' do
    expect(page).to have_content('Fries')
  end
end
