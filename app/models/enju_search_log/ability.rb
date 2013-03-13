module EnjuSearchLog
  class Ability
    include CanCan::Ability

    def initialize(user, ip_address = nil)
      case user.try(:role).try(:name)
      when 'Administrator'
        can :manage, SearchHistory
      when 'Librarian'
        can :index, SearchHistory
        can [:show, :destroy], SearchHistory do |search_history|
          search_history.user == user
        end
      when 'User'
        can :index, SearchHistory
        can [:show, :destroy], SearchHistory do |search_history|
          search_history.user == user
        end
      end
    end
  end
end
