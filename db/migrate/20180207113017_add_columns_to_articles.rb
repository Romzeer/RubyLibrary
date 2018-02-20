class AddColumnsToArticles < ActiveRecord::Migration[5.1]
  def change
    add_column :articles, :category_id, :string
  end
end
