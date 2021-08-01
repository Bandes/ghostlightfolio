require 'rails_helper'

RSpec.describe "Shows", type: :request do

  describe 'When not logged in' do
    it 'index will redirect to login screen' do
      get shows_path

      expect(response).to have_http_status(302)
      expect(response).to redirect_to(new_user_session_path)
    end
  end

  describe "GET /shows" do
    it '#index will render the index template' do
      user = create(:user)
      sign_in user

      get shows_path
      expect(response).to have_http_status(200)
      expect(response).to render_template :index
    end

    it '#edit will render the edit template' do
      user = create(:user)
      sign_in user

      show = create(:show, user: user)
      get edit_show_path(show)
      expect(response).to have_http_status(200)
      expect(response).to render_template :edit
    end

    it '#new will render the new template' do
      user = create(:user)
      sign_in user

      get new_show_path
      expect(response).to have_http_status(200)
      expect(response).to render_template :new
    end

    describe '#create' do
      it 'will create a new show when given good data' do
        user = create(:user)
        sign_in user

        params = {
          show: {
            name: 'Lady Wolfman',
            author: 'Charles Bandes',
          }
        }

        expect{ post shows_path, params: params }.to change{ Show.count }.by 1
      end

      it 'will render :new when given invalid data' do
        user = create(:user)
        sign_in user

        params = {
          show: {
            name: nil,
            author: 'Charles Bandes',
          }
        }

        post shows_path, params: params

        expect(response).to render_template(:new)

      end
    end

    describe '#update' do
      it 'will update a show when given good data' do
        user = create(:user)
        sign_in user

        show = create(:show, user: user)

        params = {
          show: {
            name: 'Playmobil Opera',
            author: 'Nobody',
          }
        }

        put show_path(show), params: params

        show.reload
        expect(show.name).to eq 'Playmobil Opera'
        expect(show.author).to eq 'Nobody'
      end

      it 'will render :edit when given invalid data' do
        user = create(:user)
        sign_in user

        show = create(:show, user: user)

        params = {
          show: {
            name: nil,
            author: 'Charles Bandes',
          }
        }
        put show_path(show), params: params
        expect(response).to render_template(:edit)

      end
    end

    it '#delete will delete a show' do
      user = create(:user)
      sign_in user

      show = create(:show, user: user)

      expect{ delete show_path(show) }.to change{ Show.count }.by -1
    end
  end
end
