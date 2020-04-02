class User < ApplicationRecord
    has_many :author_articles, foreign_key: 'author_id', class_name: 'Article'
    validates :name, presence: true,
               uniqueness: true
end
