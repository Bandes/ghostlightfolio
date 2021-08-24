# frozen_string_literal: true

class FrenchScenePolicy < ApplicationPolicy
  attr_reader :user, :french_scene

  def initialize(user, french_scene)
    @user = user
    @french_scene = french_scene
  end
end
