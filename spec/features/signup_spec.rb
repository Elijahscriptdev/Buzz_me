require 'rails_helper'

RSpec.feature 'Signups', type: :feature do
  scenario 'with correct user details' do
    visit signup_path
    user = User.new
    fill_in 'name', with: user.name
    click_button 'Signup'
    expect(page).to have_content('')
  end

  scenario 'with empty user details' do
    visit signup_path
    fill_in 'name', with: ''
    click_button 'Signup'
    expect(page).to have_content('')
  end
end
