class FixAuthorType < ActiveRecord::Migration[5.1]
  def change
    change_column :books, :auteurs_id, :string
  end
end
