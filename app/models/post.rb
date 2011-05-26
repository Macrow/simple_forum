class Post < ActiveRecord::Base
  validates :content, :presence => true

  belongs_to :forum, :counter_cache => true
  belongs_to :topic, :counter_cache => true
  belongs_to :user

  paginates_per 10

end

