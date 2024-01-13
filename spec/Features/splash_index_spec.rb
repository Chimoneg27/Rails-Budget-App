require 'rails_helper'

RSpec.feature 'SplashIndices', type: :feature do
  # user can see the logout button
  before(:each) do
    @user = create(:user, password: 'password123', password_confirmation: 'password123')
    login_as(@user, scope: :user)
    visit splash_path
  end

  # user can see the logout button
  it 'user can see the login button' do
    expect(page).to have_content('Login')
  end

  # has the text Buggy Budgets
  it 'has the text Buggy Budgets' do
    expect(page).to have_content('Buggy Budgets')
  end
end
