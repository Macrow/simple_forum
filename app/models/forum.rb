class Forum < ActiveRecord::Base
  validates :title, :presence => true

  belongs_to :section
  has_many :topics, :dependent => :destroy
  has_many :posts, :dependent => :destroy
  has_one :last_post, :class_name => "Post", :order => "updated_at DESC"

end

