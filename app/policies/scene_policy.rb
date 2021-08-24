class ScenePolicy < ApplicationPolicy
  attr_reader :user, :scene

  def initialize(user, scene)
    @user = user
    @scene = scene
  end

end
