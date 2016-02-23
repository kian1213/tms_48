class Ability
  include CanCan::Ability

  def initialize user
    if user.admin?
      can :manage, :all
    elsif user.supervisor?
      can :create, Course
      can :read, Course
      can :update, Course, user_id: user.id
      can :destroy, Course, user_id: user.id
      can :read, Subject
      can :update, Subject
      can :read, User
    else
      can :read, Course
      can :read, Subject
      can :read, Task
      can :read, User
      can :update, User, id: user.id
    end
  end
end