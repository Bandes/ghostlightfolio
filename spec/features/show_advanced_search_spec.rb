require 'rails_helper'

RSpec.feature 'Show advanced search', js: true do

  describe 'Search by ethnicity' do
    it 'Works!' do
      user = create(:user)
      login_as(user)

      author_of_asian_descent = create(:author, ethnicity: ['asian_american'])
      author_of_caucasian_descent = create(:author, ethnicity: ['caucasian'])
      show1 = create(:show, name: 'Other show')
      show2 = create(:show, name: 'Show by Asian American author')
      show1.authors << author_of_caucasian_descent
      show2.authors << author_of_asian_descent
      visit(shows_path)
      expect(page).to have_selector("#show_#{show1.id}")
      expect(page).to have_selector("#show_#{show2.id}")
      find('#advanced_search_link').click
      find('#author_ethnicity .select2-selection').click
      find('.select2-results li', text: 'Asian-American').click
      click_on('Search')
      expect(page).to have_current_path('/shows?q%5Bname_cont%5D=&q%5Bcredits_author_ethnicity_contains%5D=asian_american&q%5Bcredits_author_gender_identity_eq%5D=&q%5Bcredits_author_lgbt_eq%5D=&commit=Search')
      expect(page).to_not have_selector("#show_#{show1.id}")
      expect(page).to have_selector("#show_#{show2.id}")
    end
  end

end
