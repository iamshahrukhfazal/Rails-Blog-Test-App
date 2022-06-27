# frozen_string_literal: true

class SuggestionPolicy < ApplicationPolicy
  def index?
    %w[admin user modrator].include?(@user.role)
  end

  def show?
    %w[admin user].include?(@user.role)
  end

  def update?
    %w[admin user].include?(@user.role)
  end
end
