class Section < ActiveRecord::Base
  validates :title, :presence => true

  has_many :forums, :dependent => :destroy
end

