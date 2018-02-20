class ModifyDb < ActiveRecord::Migration[5.1]
  def change
    rename_column :comments, :article_id, :book_id
  end
end
