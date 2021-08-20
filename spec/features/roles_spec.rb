require 'rails_helper'

RSpec.feature 'Role actions' do

  describe 'Adding a role' do
    it 'User adds a role' do
      user = create(:user, editor: true)
      login_as(user)

      show = create(:show)

      visit show_path(show)
      click_on 'Add Role'
      fill_in('Name', with: 'Lady/Wolfman')
      click_on 'Create Role'
      find('.container', text: 'Role added successfully')
      expect(page).to have_content('Role added successfully')
    end
  end

end
