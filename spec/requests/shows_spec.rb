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

    it '#show will render the show template' do
      user = create(:user)

      sign_in user
      show = create(:show)
      get show_path(show)
      expect(response).to have_http_status(200)
      expect(response).to render_template :show
    end

    it '#edit will render the edit template' do
      user = create(:user)

      sign_in user

      show = create(:show)
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
        author = create(:author)

        sign_in user

        params = {
          show: {
            name: 'Lady Wolfman',
            author_ids: [author.id]
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
            author_ids: nil,
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

        show = create(:show)
        author = create(:author)

        params = {
          show: {
            name: 'Playmobil Opera',
          }
        }

        put show_path(show), params: params

        show.reload
        expect(show.name).to eq 'Playmobil Opera'
      end

      it 'will render :edit when given invalid data' do
        user = create(:user)
        author = create(:author)

        sign_in user

        show = create(:show)

        params = {
          show: {
            name: nil,
          }
        }
        put show_path(show), params: params
        expect(response).to render_template(:edit)

      end
    end

    it '#delete will delete a show' do
      user = create(:user)

      sign_in user

      show = create(:show)

      expect{ delete show_path(show) }.to change{ Show.count }.by -1
    end
  end
end
