class Ability
  include CanCan::Ability

  def initialize user
    if user.admin?
      can :manage, :all
    elsif user.supervisor?
      can :create, Courses
      can :read, Courses
      can :update, Courses do |course|
        course.try(:user) == user
      end
      can :destroy, Courses do |course|
        course.try(:user) == user
      end
      can :read, Subjects
      can :update, Subjects
      can :read, Users
    else
      can :read, Courses
      can :read, Subjects
      can :read, Tasks
      can :read, Users
    end
  end
end