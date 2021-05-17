# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= nil # guest user

    anyone_abilities

    return if user.blank?

    admin_abilities if user.admin?
    authenticated_abilities(user.id) if user.user_role?
  end

  private

  def anyone_abilities
    can :read, :all
  end

  def admin_abilities
    can %i[read create update destroy], :all
  end

  def authenticated_abilities(user_id)
    can :create, Question
    can %i[update destroy], Question, user_id: user_id
    can :create, Item
    can %i[update destroy], Item, user_id: user_id
  end
end
