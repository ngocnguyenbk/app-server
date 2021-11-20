class CreateSubCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :sub_categories do |t|
      t.references :category, null: false, foreign_key: true
      t.string :name, null: false
      t.string :slug, null: false
      t.string :hex_code, null: false
      t.text :description

      t.timestamps
    end

    add_index :sub_categories, :slug, unique: true
  end
end
