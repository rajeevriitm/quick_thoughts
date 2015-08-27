class AddIndexToResponses < ActiveRecord::Migration
  def change
        add_index :responses, :resp_id
  end
end
