  class DropPolicy
  attr_reader :current_user, :model

  def initialize(current_user, model)
    @current_user = current_user
    @drop = model
  end

  def index?
    true
  end

  def show?
    true
  end

  def edit?
    @current_user.admin? or @current_user == @drop.user
  end

  def update?
    
    @current_user.admin? or @current_user == @drop.user
  end

  def destroy?
    return false if @current_user == @drop.user
    @current_user.admin?
  end

end
