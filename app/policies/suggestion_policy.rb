# frozen_string_literal: true

# Documentation for the Class
class SuggestionPolicy < ApplicationPolicy
  def index?
    %w[admin user modrator].include?(@user.role)
  end

  def show?
    %w[admin user].include?(@user.role)
  end

  def create?
    %w[admin user].include?(@user.role)
  end

  def update?
    %w[admin user].include?(@user.role)
  end
end
