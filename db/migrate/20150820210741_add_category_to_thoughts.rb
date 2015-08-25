class AddCategoryToThoughts < ActiveRecord::Migration
  def change
    add_column :thoughts, :category, :string
  end
end
