require 'rails_helper'

RSpec.feature 'Logins', type: :feature do
  scenario 'with correct user details' do
    visit login_path
    user = User.new
    fill_in 'name', with: user.name
    click_button 'Login'
    expect(page).to have_content('')
  end

  scenario 'with incorrect user details' do
    visit login_path
    fill_in 'name', with: 'wrong info'
    click_button 'Login'
    expect(page).to have_content('')
  end
end
