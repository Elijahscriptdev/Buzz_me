class User < ApplicationRecord
  has_many :author_articles, foreign_key: 'author_id', class_name: 'Article'
  validates :name, presence: true,
                   uniqueness: true

  has_many :votes

  def upvote(article)
    votes.create(is_upvote: true, article: article)
  end

  def upvoted?(article)
    votes.exists?(is_upvote: true, article: article)
  end

  def remove_vote(article)
    votes.find_by(article: article).destroy
  end

  def downvote(article)
    votes.create(is_downvote: true, article: article)
  end

  def downvoted?(article)
    votes.exists?(is_downvote: true, article: article)
  end

end
