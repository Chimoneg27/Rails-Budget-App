# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    can :read, :all
    can :manage, :all
    can :manage, User, user_id: user.id
    can :manage, Groups, user_id: user.id
  end
end
