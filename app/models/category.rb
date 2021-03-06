class Category < ApplicationRecord
  has_many :articles, dependent: :destroy
  validates :name, presence: true
  scope :ordered_by_priority, -> { order(priority: :asc).limit(4) }
end
