class AuthorPolicy < ApplicationPolicy
  attr_reader :user, :author

  def initialize(user, author)
    @user = user
    @author = author
  end

end
