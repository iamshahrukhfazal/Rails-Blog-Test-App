# frozen_string_literal: true

class ReportPolicy < ApplicationPolicy
  def index?
    # byebug
    @roles_admin_moderator.include?(@user.role)
    # true
  end

  def show?
    @roles_admin_moderator.include?(@user.role)
  end
  def create?
    ["user","admin"].include?(@user.role)
  end

  def all_reported_comment?
    @roles_admin_moderator.include?(@user.role)
  end

  def all_reported_post?
    @roles_admin_moderator.include?(@user.role)
  end
end
