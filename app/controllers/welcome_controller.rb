# frozen_string_literal: true

class WelcomeController < ApplicationController
    def home
    @categories_by_priority = Category.ordered_by_priority.all

    @articles = Article.all.map do |article|
      article if article.votes.max
    end

    @featured = Article.featured
    @featured_recent = Article.featured_recent

    @categories = Category.all
    cate = params[:cate]
    @articles = if !cate.nil?
                  Article.where(category_id: cate)
                else
                  Article.all
                end
  end
end
