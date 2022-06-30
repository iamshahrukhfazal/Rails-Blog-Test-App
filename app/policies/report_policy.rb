# frozen_string_literal: true

# Documentation for the Class
class ReportPolicy < ApplicationPolicy
  def index?
    @roles_admin_moderator.include?(@user.role)
  end

  def show?
    @roles_admin_moderator.include?(@user.role)
  end

  def create?
    %w[user admin].include?(@user.role)
  end

  def all_reported_comment?
    @roles_admin_moderator.include?(@user.role)
  end

  def all_reported_post?
    @roles_admin_moderator.include?(@user.role)
  end
end
