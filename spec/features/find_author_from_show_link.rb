require 'rails_helper'

RSpec.feature 'Find author from show link' do

  describe 'Click on author from show' do
    it 'Highlights author on correct page of table' do
      user = create(:user)
      login_as(user)

      george = create(:author, first_name: 'George', last_name: 'Washington')
      show = create(:show, name: 'Show')
      show.authors << george
      visit(show_path(show))
      button = find('.btn', text: 'GEORGE WASHINGTON')
      button.click
      expect(page).to have_content('George Washington')
      row = find("#author_#{george.id}")
      expect(row[:class]).to include('active')
    end
  end
end
