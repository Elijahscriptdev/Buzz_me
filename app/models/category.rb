# frozen_string_literal: true

class Category < ApplicationRecord
  has_many :articles, dependent: :destroy
  validates :name, presence: true

  scope :ordered_by_priority, -> { order(priority: :asc) }
end
