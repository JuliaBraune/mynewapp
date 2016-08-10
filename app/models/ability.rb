class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.admin?
        can :manage, :all
    else
        can [:edit, :read, :destroy], [User, Order], :id => user.id  
        can :read, Product
        cannot [:destroy, :edit], Product
    end 
  end
end
