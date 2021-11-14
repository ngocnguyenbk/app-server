class CreateArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :articles do |t|
      t.references :sub_category, foreign_key: true, null: false
      t.references :author, foreign_key: true, null: false
      t.string :addresses, null: false
      t.string :title, null: false
      t.text :body, null: false
      t.integer :status, null: false, default: 0
      t.datetime :published_at, null: false

      t.timestamps
    end
  end
end
