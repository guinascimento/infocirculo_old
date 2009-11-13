class CreateFriendships < ActiveRecord::Migration
  def self.up
    create_table :friendships do |t|
      t.references :user, :friend
      t.datetime :requested_at, :accepted_at, :null => true, :default => nil
      t.string :status
    end

    add_index :friendships, :user_id
    add_index :friendships, :friend_id
    add_index :friendships, :status
    add_column :users, :friends_count, :integer, :default => 0, :null => false
  end

  def self.down
    drop_table :friendships
    remove_column :users, :friends_count
  end
end