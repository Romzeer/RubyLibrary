class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.string :title
      t.string :text
      t.string :image
      t.integer :category_id
      t.integer :auteur_id

      t.timestamps
    end
  end
end
