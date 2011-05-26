class AddUserRelationshipToTopicAndPost < ActiveRecord::Migration
  def self.up
    add_column :topics, :user_id, :integer
    add_column :posts, :user_id, :integer
  end

  def self.down
    remove_column :posts, :user_id
    remove_column :topics, :user_id
  end
end

