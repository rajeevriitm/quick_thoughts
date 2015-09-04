class AddIndexToRelationships < ActiveRecord::Migration
  def change
    add_index :relationships, :follower_id
    add_index :relationships, :following_id
    add_index :relationships, [:follower_id,:following_id],unique: true

  end
end
