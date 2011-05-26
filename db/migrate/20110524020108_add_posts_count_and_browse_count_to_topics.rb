class AddPostsCountAndBrowseCountToTopics < ActiveRecord::Migration
  def self.up
    add_column :topics, :posts_count, :integer, :default => 0
    add_column :topics, :browse_count, :integer, :default => 0

    Topic.reset_column_information
    Topic.all.each do |t|
      t.update_attribute :posts_count, t.posts.length
    end
  end

  def self.down
    remove_column :topics, :browse_count
    remove_column :topics, :posts_count
  end
end

