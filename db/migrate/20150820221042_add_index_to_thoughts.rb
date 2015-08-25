class AddIndexToThoughts < ActiveRecord::Migration
  def change
    add_index :thoughts, :category
  end
end
