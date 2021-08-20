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

  SHOW_TYPES = {
    musical: 'Musical',
    revue: 'Musical Revue',
    play: 'Play',
    play_with_music: 'Play with Music',
    operetta: 'Operetta',
  }.freeze

  SHOW_GENRES = {
    comedy: 'Comedy',
    drama: 'Drama',
    documentary: 'Documentary',
    seriocomic: 'Serio-Comic',
    tragedy: 'Tragedy',
    rock: 'Pop-Rock',
    romance: 'Romance',
  }.freeze

  def self.gender_identities_for_select
    GENDER_IDENTITIES.map { |key, value| [value, key] }
  end

  def self.ethnicities_for_select
    ETHNICITIES.map { |key, value| [value, key] }
  end

  def self.show_genres_for_select
    SHOW_GENRES.map { |key, value| [value, key] }
  end

  def self.show_types_for_select
    SHOW_TYPES.map { |key, value| [value, key] }
  end

end
