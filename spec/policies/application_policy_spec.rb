require 'rails_helper'

RSpec.describe ApplicationPolicy do

  describe 'index?' do
    it 'permits everyone' do
      user = build(:user)
      record = Object.new
      subject = ApplicationPolicy.new(user, record)
      expect(subject.index?).to be true
    end
  end

  describe 'show?' do
    it 'permits everyone' do
      user = build(:user)
      record = Object.new
      subject = ApplicationPolicy.new(user, record)
      expect(subject.show?).to be true
    end
  end

  describe 'edit?' do
    it 'permits admins' do
      user = build(:user, admin: true)
      record = Object.new
      subject = ApplicationPolicy.new(user, record)
      expect(subject.edit?).to be true
    end

    it 'permits editors' do
      user = build(:user, editor: true)
      record = Object.new
      subject = ApplicationPolicy.new(user, record)
      expect(subject.edit?).to be true
    end

    it 'refuses regular users' do
      user = build(:user)
      record = Object.new
      subject = ApplicationPolicy.new(user, record)
      expect(subject.edit?).to be false
    end
  end

  describe 'destroy?' do
    it 'permits admins' do
      user = build(:user, admin: true)
      record = Object.new
      subject = ApplicationPolicy.new(user, record)
      expect(subject.destroy?).to be true
    end

    it 'refuses editors' do
      user = build(:user, editor: true)
      record = Object.new
      subject = ApplicationPolicy.new(user, record)
      expect(subject.destroy?).to be false
    end

    it 'refuses refular users' do
      user = build(:user)
      record = Object.new
      subject = ApplicationPolicy.new(user, record)
      expect(subject.destroy?).to be false
    end
  end

  describe 'scope' do
    it 'returns all records to all users' do
      user = build(:user)
      create_list(:show, 2)
      expect(Pundit.policy_scope!(user, Show)).to match_array(Show.all)
    end
  end

end
