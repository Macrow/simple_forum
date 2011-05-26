class AddForumIdToPosts < ActiveRecord::Migration
  def self.up
    add_column :posts, :forum_id, :integer

    Post.reset_column_information
    Post.all.each do |p|
      p.update_attribute :forum_id, p.topic.forum.id
    end
  end

  def self.down
    remove_column :posts, :forum_id
  end
end

