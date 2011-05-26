class Topic < ActiveRecord::Base
  validates :title, :presence => true
  validates :content, :presence => true

  has_many :posts, :dependent => :destroy
  has_one :last_post, :class_name => "Post", :order => "updated_at DESC"

  belongs_to :forum, :counter_cache => true
  belongs_to :user

  paginates_per 20

  def browse_once
    Topic.update_all ['browse_count = ?', (self.browse_count + 1)], ['id = ?', self.id]
  end

end

