class CreateComment < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.string :text
      t.integer :auteur_id
      t.references :book, foreign_key: true

      t.timestamps
    end
  end
end
