require 'rails_helper'

RSpec.describe 'Articles', type: :feature do
  let(:user) { User.create(name: 'jay') }
  let(:article) { Article.create(title: 'sportS', description: 'education', image: 'image.png', category_id: 1) }
  scenario 'Get Homepage' do
    visit login_path
    fill_in 'name', with: user.name
    click_button 'Login'
    expect(page).to have_content('Home')
  end

  scenario 'Write an Article' do
    visit login_path
    fill_in 'name', with: user.name
    click_button 'Login'
    expect(page).to have_content('Home')
    visit new_article_path
    expect(page).to have_content('Write an Article')

    fill_in 'Tittle', with: article.title
    fill_in 'Description', with: article.description
    click_button 'Create Article'
    expect(page).to have_content("Image can't be blank")
  end

  scenario 'Write an Article with incorrect details' do
    visit login_path
    fill_in 'name', with: user.name
    click_button 'Login'
    visit new_article_path
    fill_in 'Tittle', with: article.title
    fill_in 'Description', with: article.description
    click_button 'Create Article'
    expect(page).to have_content("Category can't be blank")
  end
end
