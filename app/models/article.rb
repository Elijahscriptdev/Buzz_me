class Article < ApplicationRecord
  belongs_to :author, class_name: "User"
  belongs_to :category
  mount_uploader :image, ImageUploader
end
