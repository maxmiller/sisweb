class Ability
  include CanCan::Ability

  def initialize(user)

    user ||= User.new
    if user.roles? :administrador
      can :manage, :all
    elsif user.roles? :vendedor
      can :manage, State
    else
      can :read, :all
    end

  end




end
