class CreateTopics < ActiveRecord::Migration[6.1]
  def change
    create_table :topics do |t|
      t.references :category, null: false, foreign_key: true
      t.string :name, null: false
      t.string :slug, null: false
      t.text :description, null: false

      t.timestamps
    end
  end
end
