require 'rails_helper'

RSpec.describe Constants do

  describe 'gender_identities_for_select' do
    it 'returns values as array for simple_form' do
      expect(Constants.gender_identities_for_select).to match_array([['Male', :male], ['Female', :female], ['Trans/Nonbinary', :nonbinary]])
    end
  end

  describe 'ethnicities_for_select' do
    it 'returns values as array for simple_form' do
      expect(Constants.ethnicities_for_select).to match_array([['Asian or Pacific Islander', :asian], ['Black', :black], ['Indigenous', :indigenous], ['Latinx', :latinx], ['White', :white]] )
    end
  end

end
