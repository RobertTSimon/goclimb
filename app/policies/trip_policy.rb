class TripPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def new?
    return true
  end

  def create?
    new?
  end

  def show?
    true
  end

  def update?
    true
    # - record: the restaurant passed to the `authorize` method in controller
    # - user:   the `current_user` signed in with Devise.
  end

  def destroy?
    user_is_owner?
  end

  def delete?
    user_is_owner?
  end

  private

  def user_is_owner?
    record.user == user
  end
end
