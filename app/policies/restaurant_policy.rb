class RestaurantPolicy < ApplicationPolicy
  def create?
    true
  end

  def new?
    true
  end

  def show?
    # record == @restaurant
    # user == current_user
    # record.user == user
    true
  end

  def edit?
    (record.user == user) || user.admin
  end

  def update?
    (record.user == user) || user.admin
  end

  class Scope < Scope
    def resolve
      # scope == Restaurant
      scope.all
    end
  end
end
