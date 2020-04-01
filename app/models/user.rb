class User < ApplicationRecord
  validates :name, presence: true,
                   uniqueness: true
end
