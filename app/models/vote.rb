class Vote < ApplicationRecord
  validates :user_id, uniqueness: { scope: :article_id }
  belongs_to :user
  belongs_to :article

  scope :upvote, -> { where('is_upvote') }

  scope :downvote, -> { where('is_downvote') }
end
