require 'rails_helper'

RSpec.describe "People", type: :request do
  describe "GET /people" do
    it '#index will render the index template' do
      user = create(:user)
      sign_in user

      get people_path
      expect(response).to have_http_status(200)
      expect(response).to render_template :index
    end

    it '#edit will render the edit template' do
      user = create(:user)
      sign_in user

      person = create(:person, user: user)
      get edit_person_path(person)
      expect(response).to have_http_status(200)
      expect(response).to render_template :edit
    end

    it '#new will render the new template' do
      user = create(:user)
      sign_in user

      get new_person_path
      expect(response).to have_http_status(200)
      expect(response).to render_template :new
    end

    it '#create will create a new person' do
      user = create(:user)
      sign_in user

      params = {
        person: {
          first_name: 'First',
          last_name: 'Last',
          email: 'email@example.com',
          phone: '555-555-5555'
        }
      }

      expect{ post people_path, params: params }.to change{ Person.count }.by 1
    end

    it '#update will update a person' do
      user = create(:user)
      sign_in user

      person = create(:person, user: user)

      params = {
        person: {
          first_name: 'George',
          last_name: 'Washington',
          email: 'george@washington.com',
          phone: '888-888-8888'
        }
      }

      put person_path(person), params: params

      person.reload
      expect(person.first_name).to eq 'George'
      expect(person.last_name).to eq 'Washington'
      expect(person.email).to eq('george@washington.com')
      expect(person.phone).to eq('888-888-8888')
    end

    it '#delete will delete a person' do
      user = create(:user)
      sign_in user

      person = create(:person, user: user)

      expect{ delete person_path(person) }.to change{ Person.count }.by -1
    end
  end
end
