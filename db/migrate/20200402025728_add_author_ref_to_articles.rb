class AddAuthorRefToArticles < ActiveRecord::Migration[6.0]
  def change
    add_reference :articles, :author, foreign_key: { to_table: :users }
  end
end
