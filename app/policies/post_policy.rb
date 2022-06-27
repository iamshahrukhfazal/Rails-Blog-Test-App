# frozen_string_literal: true

class PostPolicy < ApplicationPolicy
  def index?
    # byebug
    ["moderator","user","admin"].include?(@user.role)
    # true
  end

  def show?
    ["user","admin"].include?(@user.role)
  end
  def new?
    ["user","admin"].include?(@user.role)
  end

  def create?
    ["user","admin"].include?(@user.role)
  end

  def destroy?
    ["modrator","admin"].include?(@user.role)
  end

  def update?
    ["modrator","admin"].include?(@user.role)
  end

end


