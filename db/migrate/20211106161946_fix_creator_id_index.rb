class FixCreatorIdIndex < ActiveRecord::Migration[6.1]
  def change
    remove_index :events, column: :creator_id
  end
end
