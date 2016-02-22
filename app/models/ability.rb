class Ability
  include CanCan::Ability

  def initialize user
    if user.admin?
      can :manage, :all
    elsif user.is? :supervisor
      #TODO
    else
      #TODO
    end
  end
end
