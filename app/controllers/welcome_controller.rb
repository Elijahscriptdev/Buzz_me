class WelcomeController < ApplicationController
  def home
    @categories = Category.all
    @categories_by_priority = Category.ordered_by_priority.all

    @articles = Article.all.map do |article|
      article if article.votes.max
    end

    @featured = Article.featured
    @featured_recent = Article.featured_recent
  end
end
