# frozen_string_literal: true

class Constants
  GENDER_IDENTITIES = {
    female: 'Female',
    male: 'Male',
    nonbinary: 'Nonbinary',
    trans: 'Trans',
    other: 'Other',
  }.freeze

  ETHNICITIES = {
    african: 'African',
    asian_american: 'Asian-American',
    black: 'African-American/Black',
    east_asian: 'East Asian',
    caucasian: 'Caucasian/White',
    indigenous: 'Indigenous/First Nations',
    middle_eastern: 'Middle Eastern',
    latinx: 'Hispanic/Latine',
    south_asian: 'South Asian',
    southeast_asian: 'Southeast Asian',
    pacific_islander: 'Pacific Islander',
    other: 'Other',
  }.freeze

  def self.gender_identities_for_select
    GENDER_IDENTITIES.map { |key, value| [value, key] }
  end

  def self.ethnicities_for_select
    ETHNICITIES.map { |key, value| [value, key] }
  end
end
