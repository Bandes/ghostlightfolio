require 'rails_helper'

RSpec.feature 'User submits contact form' do

  describe 'Submit form' do
    it 'With a good message' do
      user = create(:user)
      login_as(user)
      
      visit contacts_path

      fill_in('contact_form[name]', with: 'George')
      fill_in('contact_form[email]', with: 'george@example.com')
      fill_in('contact_form[message]', with: 'Hi!')
      click_on('Send Message')

      expect(page).to have_content('Thank you for your message!')
    end

  end
end
