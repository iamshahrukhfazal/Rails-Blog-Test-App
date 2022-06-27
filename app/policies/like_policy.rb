class LikePolicy < ApplicationPolicy

  def create?
    ["user","admin"].include?(@user.role)
  end

  def destroy?
    ["user","admin"].include?(@user.role)
  end

end
