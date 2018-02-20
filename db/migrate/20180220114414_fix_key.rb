class FixKey < ActiveRecord::Migration[5.1]
  def change
    add_reference :auteurs, :books, index: true
    add_reference :categories, :books, index: true
  end
end
