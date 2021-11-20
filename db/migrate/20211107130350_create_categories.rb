class CreateCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :categories do |t|
      t.string :name, null: false
      t.string :slug, null: false
      t.string :hex_code, null: false
      t.text :description

      t.timestamps
    end

    add_index :categories, :slug, unique: true
  end
end
