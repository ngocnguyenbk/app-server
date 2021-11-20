class CreateAuthors < ActiveRecord::Migration[6.1]
  def change
    create_table :authors do |t|
      t.string :full_name, null: false
      t.string :email
      t.string :nickname, null: false
      t.string :slug, null: false
      t.text :profile

      t.timestamps
    end
  end
end
