# frozen_string_literal: true

class PostPolicy < ApplicationPolicy
  def index?
    # byebug
    %w[moderator user admin].include?(@user.role)
    # true
  end

  def show?
    %w[user admin].include?(@user.role)
  end

  def new?
    %w[user admin].include?(@user.role)
  end

  def create?
    %w[user admin].include?(@user.role)
  end

  def destroy?
    %w[modrator admin].include?(@user.role)
  end

  def update?
    %w[modrator admin].include?(@user.role)
  end
end
