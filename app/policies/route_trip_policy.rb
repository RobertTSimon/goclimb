class RoutePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def destroy?
    user_is_owner?
  end

  private

  def user_is_owner?
    record.user == user
  end
end
