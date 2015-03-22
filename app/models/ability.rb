class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #

    @user = user || User.new # for guest
    @user.roles.each { |role| send(role.name.downcase) }

    # Access to edit own profile
    can :manage, User do |user|
      user && user == @user
    end

    if @user.roles.size == 0
      can :read, :all #for guest without roles
      cannot :index, ResortCategory
      cannot :read, ActiveAdmin
    end



    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end

  def admin
    can :manage, :all
    can :read, ActiveAdmin::Page, :name => 'Dashboard'
  end

  def editor
    can :manage, [Resort, ResortCategory]
  end
  def athlete
  end

end
