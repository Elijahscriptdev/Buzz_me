class Article < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :category
  mount_uploader :image, ImageUploader
  has_many :votes

  # acts_as_votable

  validates :image, presence: true
  validates :title, presence: true, length: { minimum: 3, maximum: 50 }
  validates :description, presence: true, length: { minimum: 7, maximum: 9350 }
  validates :category_id, presence: true

  scope :ordered_by_most_recent, -> { order(created_at: :desc) }

  # scope :first_article, -> { order(created_at: :desc).first(1) }
  scope :most_recent, -> { order(created_at: :desc).first(1) }
  # scope :recent, -> { order(created_at: :desc) }
  scope :featured_recent, -> { order(created_at: :desc).first(1) }
  scope :featured, -> { order(votes_count: :desc).first }
  scope :most_popular, -> { order(votes_count: :desc).first(5) }

  # def upvotes
  #   votes.sum(:upvote)
  # end

  # def downvotes
  #   votes.sum(:downvote)
  # end

  def upvote
    votes.upvote
  end
  def downvote
    votes.downvote
  end

end
