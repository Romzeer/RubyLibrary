class AddAuthorKey < ActiveRecord::Migration[5.1]
  def change
    add_reference :books, :auteurs, foreign_key: true

  end
end
