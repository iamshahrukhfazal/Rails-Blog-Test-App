# frozen_string_literal: true

# Documentation for the Class
class CommentPolicy < ApplicationPolicy
  def create?
    %w[user admin].include?(@user.role)
  end

  def destroy?
    %w[modrator admin].include?(@user.role)
  end
end
