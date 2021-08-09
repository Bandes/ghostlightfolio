# frozen_string_literal: true

class Constants
  GENDER_IDENTITIES = {
    male: 'Male',
    female: 'Female',
    nonbinary: 'Trans/Nonbinary'
  }.freeze

  ETHNICITIES = {
    asian: 'Asian or Pacific Islander',
    black: 'Black',
    indigenous: 'Indigenous',
    latinx: 'Latinx',
    white: 'White'
  }.freeze

  def self.gender_identities_for_select
    GENDER_IDENTITIES.map { |key, value| [value, key] }
  end

  def self.ethnicities_for_select
    ETHNICITIES.map { |key, value| [value, key] }
  end
end
