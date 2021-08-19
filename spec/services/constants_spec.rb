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

end
