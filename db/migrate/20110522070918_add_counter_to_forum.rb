class AddCounterToForum < ActiveRecord::Migration
  def self.up
    add_column :forums, :topics_count, :integer, :default => 0
    add_column :forums, :posts_count, :integer, :default => 0

    Forum.reset_column_information
    Forum.all.each do |f|
      f.update_attribute :topics_count, f.topics.length
      f.update_attribute :posts_count, f.posts.length
    end
  end

  def self.down
    remove_column :forums, :posts_count
    remove_column :forums, :topics_count
  end
end

