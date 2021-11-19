class AddTopicToArticles < ActiveRecord::Migration[6.1]
  def change
    add_reference :articles, :topic, foreign_key: true, index: true
  end
end
