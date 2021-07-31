require 'rails_helper'

RSpec.describe "Locations", type: :request do

  describe 'When not logged in' do
    it 'index will redirect to login screen' do
      get locations_path

      expect(response).to have_http_status(302)
      expect(response).to redirect_to(new_user_session_path)
    end
  end

  describe "GET /locations" do
    it '#index will render the index template' do
      user = create(:user)
      sign_in user

      get locations_path
      expect(response).to have_http_status(200)
      expect(response).to render_template :index
    end

    it '#edit will render the edit template' do
      user = create(:user)
      sign_in user

      location = create(:location, user: user)
      get edit_location_path(location)
      expect(response).to have_http_status(200)
      expect(response).to render_template :edit
    end

    it '#new will render the new template' do
      user = create(:user)
      sign_in user

      get new_location_path
      expect(response).to have_http_status(200)
      expect(response).to render_template :new
    end

    describe '#create' do
      it 'will create a new location when given good data' do
        user = create(:user)
        sign_in user

        params = {
          location: {
            name: 'Orpheum',
            address: '123 Fake Street',
            capacity: 100,
          }
        }

        expect{ post locations_path, params: params }.to change{ Location.count }.by 1
      end

      it 'will render :new when given invalid data' do
        user = create(:user)
        sign_in user

        params = {
          location: {
            name: nil,
            capacity: 100,
          }
        }

        post locations_path, params: params

        expect(response).to render_template(:new)

      end
    end

    describe '#update' do
      it 'will update a location when given good data' do
        user = create(:user)
        sign_in user

        location = create(:location, user: user)

        params = {
          location: {
            name: 'Big Top',
            address: '456 Real Street',
            capacity: 5,
          }
        }

        put location_path(location), params: params

        location.reload
        expect(location.name).to eq 'Big Top'
        expect(location.address).to eq '456 Real Street'
        expect(location.capacity).to eq(5)
      end

      it 'will render :edit when given invalid data' do
        user = create(:user)
        sign_in user

        location = create(:location, user: user)

        params = {
          location: {
            name: nil,
            capacity: 100,
          }
        }
        put location_path(location), params: params
        expect(response).to render_template(:edit)

      end
    end

    it '#delete will delete a location' do
      user = create(:user)
      sign_in user

      location = create(:location, user: user)

      expect{ delete location_path(location) }.to change{ Location.count }.by -1
    end
  end
end
