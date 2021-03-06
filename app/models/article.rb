class Article < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :category
  mount_uploader :image, ImageUploader
  has_many :votes

  validates :image, presence: true
  validates :title, presence: true, length: { minimum: 3, maximum: 50 }
  validates :description, presence: true, length: { minimum: 7, maximum: 9350 }
  validates :category_id, presence: true

  scope :ordered_by_most_recent, -> { order(created_at: :desc) }
  scope :most_recent, -> { order(created_at: :desc).first(1) }
  scope :most_popular, -> { order(votes_count: :desc).first(1) }

  def upvote
    votes.upvote
  end

  def downvote
    votes.downvote
  end
end
