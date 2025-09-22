class PostPolicy < ApplicationPolicy

  def index?
    true
  end

  def show?
    true
  end

  def create?
    user.present?
  end

  def new?
    create?
  end

  def update?
    # user.present? && (record.user == user || user.admin?)
    true
  end

  def edit?
    update?
  end

  def destroy?
    # user.present? && user.admin? || record.user_id == user
    true
  end

  class Scope < ApplicationPolicy::Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end
end
