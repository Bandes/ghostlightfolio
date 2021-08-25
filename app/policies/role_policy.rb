# frozen_string_literal: true

class RolePolicy < ApplicationPolicy
  attr_reader :user, :role

  def initialize(user, role)
    @user = user
    @role = role
  end
end
