# frozen_string_literal: true

class LikePolicy < ApplicationPolicy
  def create?
    %w[user admin].include?(@user.role)
  end

  def destroy?
    %w[user admin].include?(@user.role)
  end
end
