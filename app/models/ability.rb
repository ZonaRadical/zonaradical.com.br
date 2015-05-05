class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #

    @user = user || User.new # for guest

    can :read, :all # everyone can read everything

    # Access to edit own profile
    can :manage, User do |user|
      user && user == @user
    end
    
    # registered users
    if @user.persisted?
      can :create, Tour
      
      can :manage, Tour do |tour|
        tour.owners.collect { |owner| owner.user }.include?(@user)
      end

      can :manage, Tour::Owner do |tour_owner|
        tour_owner.tour.owners.collect { |owner| owner.user }.include?(@user)
      end

      can :manage, Tour::Participant do |tour_participant|
        tour_participant.tour.user_owners.include?(@user)
      end

      can :create, Tour::Participant
    end

    @user.roles.each { |role| send(role.name.downcase) }


    #for guest without roles
    if @user.roles.size == 0
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
    can :manage, ImageGallery
  end

  def agency
    can :manage, Offer

    can :manage, Offer::Owner do |offer_owner|
        offer_owner.offer.owners.collect { |owner| owner.user }.include?(@user)
      end

      can :manage, Offer::Participant do |offer_participant|
        offer_participant.offer.user_owners.include?(@user)
      end

    cannot :manage, Tour
  end

end
