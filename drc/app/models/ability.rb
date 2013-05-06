class Ability
  include CanCan::Ability

  def initialize(user)

    user ||= User.new
    if user.roles? :administrador
      can :manage, :all
    elsif user.roles? :vendedor
      can :manage, State
      can :manage, Client
      can :manage, Producer
      can :manage, Group
      can :manage, Subgroup
      can :manage, Order
      can :manage, OrderItem
    else
      can :read, :all
    end

  end




end
