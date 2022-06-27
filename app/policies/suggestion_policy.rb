class SuggestionPolicy < ApplicationPolicy
  def index?
    ["admin","user","modrator"].include?(@user.role)
  end
  def show?
    ["admin","user"].include?(@user.role)
  end 
  def update?
    ["admin","user"].include?(@user.role)
  end
end
