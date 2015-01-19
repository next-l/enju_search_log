class SearchHistoryPolicy < ApplicationPolicy
  def index?
    true if user.try(:has_role?, 'User')
  end

  def show?
    case user.try(:role).try(:name)
    when 'Administrator'
      true
    when 'Librarian'
      true if record.user == user
    when 'User'
      true if record.user == user
    end
  end

  def create?
    false
  end

  def update?
    false
  end

  def destroy?
    show?
  end

  def remove_all?
    true if user.try(:has_role?, 'User')
  end
end
