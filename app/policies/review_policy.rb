class ReviewPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def new?
    user.route_setter
  end

  def create?
    return true
  end

  def show?
    return true
  end

  def update?
    user_is_owner?
    # - record: the restaurant passed to the `authorize` method in controller
    # - user:   the `current_user` signed in with Devise.
  end

  def destroy?
    user_is_owner?
  end

  def mark_as_fixed?
    record.route.user == user
  end

  private

  def user_is_owner?
    record.user == user
  end
end
