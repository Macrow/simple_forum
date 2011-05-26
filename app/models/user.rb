class User < ActiveRecord::Base

  attr_accessor :login

  validates :user_name, :presence => true, :uniqueness => true

  devise :database_authenticatable, :registerable, :timeoutable,
         :recoverable, :rememberable, :trackable, :validatable, :lockable

  attr_accessible :login, :user_name, :email, :password, :password_confirmation, :remember_me

  has_and_belongs_to_many :roles
  has_many :topics
  has_many :posts
  has_many :assets

  def role?(role)
    roles.collect(&:name).include?(role)
  end

  protected

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    login = conditions.delete(:login)
    where(conditions).where(["lower(user_name) = :value OR lower(email) = :value", { :value => login.downcase }]).first
  end

end

