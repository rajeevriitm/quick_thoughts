class AddTaggListColumnToThoughts < ActiveRecord::Migration
  def change
    add_column :thoughts, :tag_list, :text
  end
end
