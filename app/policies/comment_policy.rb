class CommentPolicy < ApplicationPolicy
  def create?
    ["user","admin"].include?(@user.role)
  end

  def destroy?
    ["modrator","admin"].include?(@user.role)
  end

end
