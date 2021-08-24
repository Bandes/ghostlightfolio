class ActPolicy < ApplicationPolicy
  attr_reader :user, :act

  def initialize(user, act)
    @user = user
    @act = act
  end

end
