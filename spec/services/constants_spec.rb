require 'rails_helper'

RSpec.describe Constants do

  describe 'gender_identities_for_select' do
    it 'returns values as array for simple_form' do
      expect(Constants.gender_identities_for_select).to match_array([["Female", :female], ["Male", :male], ["Nonbinary", :nonbinary], ["Trans", :trans], ["Other", :other]])
    end
  end

  describe 'ethnicities_for_select' do
    it 'returns values as array for simple_form' do
      expect(Constants.ethnicities_for_select).to match_array([
        ["African", :african], 
        ["Asian-American", :asian_american], 
        ["African-American/Black", :black], 
        ["East Asian", :east_asian], 
        ["Caucasian/White", :caucasian], 
        ["Indigenous/First Nations", :indigenous], 
        ["Middle Eastern", :middle_eastern], 
        ["Hispanic/Latine", :latinx],
        ["South Asian", :south_asian], 
        ["Southeast Asian", :southeast_asian], 
        ["Pacific Islander", :pacific_islander], 
        ["Other", :other]
      ] )
    end
  end

  describe 'show_types_for_select' do
    it 'returns values as array for simple_form' do
      expect(described_class.show_types_for_select).to match_array([["Musical", :musical], ["Musical Revue", :revue], ["Play", :play], ["Play with Music", :play_with_music], ["Operetta", :operetta]])
    end
  end

  describe 'show_genres_for_select' do
    it 'returns values as array for simple_form' do
      expect(described_class.show_genres_for_select).to match_array([["Comedy", :comedy], ["Drama", :drama], ["Documentary", :documentary], ["Serio-Comic", :seriocomic], ["Tragedy", :tragedy], ["Pop-Rock", :rock]])
    end
  end

end
