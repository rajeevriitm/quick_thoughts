class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.references :thought, index: true, foreign_key: true
      t.integer :resp_id

      t.timestamps null: false
    end
  end
end
