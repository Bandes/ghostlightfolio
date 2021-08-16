class ShowPolicy < ApplicationPolicy
  attr_reader :user, :show

  def initialize(user, show)
    @user = user
    @show = show
  end

end
