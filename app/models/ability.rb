# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the user here. For example:
    return unless user.present?

    can :manage, Group, author: user
    can :manage, Entity, author: user
  end
end
