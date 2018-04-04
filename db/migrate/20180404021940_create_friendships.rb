class CreateFriendships < ActiveRecord::Migration
  def change
    create_table :friendships do |t|
      t.references :user, index: true, foreign_key: true
      t.references :friend, index: true

      t.timestamps null: false
    end
    add_foreign_key :friendships, :users, column: :friend
    add_index :friendships, [:user_id, :friend_id], unique: true
  end
end
