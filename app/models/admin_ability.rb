class AdminAbility
  include CanCan::Ability

  def initialize(user)
    @user = user || User.new # for guest
    @user.roles.each { |role| send(role.name.downcase) }

    def admin
      can :manage, :all
      can :read, ActiveAdmin::Page, :name => 'Dashboard'
    end

    def editor
    end

  end
end
