class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.role?("admin")
      can :manage, :all
    else
      can :read, :all
      if user.role?("editor")
        can :manage, [Topic, Post]
        can :update, User do |u|
          u == user
        end
      end
      if user.role?("guest")
        can :create, [Topic, Post]
        can :update, User do |u|
          u == user
        end
      end
      can :update, Post do |post|
        post.try(:user) == user
      end
      can :update, Topic do |topic|
        topic.try(:user) == user
      end
    end
  end
end

