require 'rails_helper'

RSpec.describe "Authors", type: :request do

  describe 'When not logged in' do
    it 'index will redirect to login screen' do
      get authors_path

      expect(response).to have_http_status(302)
      expect(response).to redirect_to(new_user_session_path)
    end
  end

  describe "GET /authors" do
    it '#index will render the index template' do
      user = create(:user)
      sign_in user

      get authors_path
      expect(response).to have_http_status(200)
      expect(response).to render_template :index
    end

    it '#edit will render the edit template' do
      user = create(:user)
      sign_in user

      author = create(:author)
      get edit_author_path(author)
      expect(response).to have_http_status(200)
      expect(response).to render_template :edit
    end

    it '#new will render the new template' do
      user = create(:user)
      sign_in user

      get new_author_path
      expect(response).to have_http_status(200)
      expect(response).to render_template :new
    end

    it '#show will render the show template' do
      user = create(:user)

      sign_in user
      author = create(:author)
      get author_path(author)
      expect(response).to have_http_status(200)
      expect(response).to render_template :show
    end


    describe '#create' do
      it 'will create a new author when given good data' do
        user = create(:user)
        sign_in user

        params = {
          author: {
            first_name: 'William',
            last_name: 'Shakespeare',
            gender_identity: 'male',
            ethnicity: 'white',
          }
        }

        expect{ post authors_path, params: params }.to change{ Author.count }.by 1
      end

      it 'will render :new when given invalid data' do
        user = create(:user)
        sign_in user

        params = {
          author: {
            first_name: nil,
            last_name: nil
          }
        }

        post authors_path, params: params

        expect(response).to render_template(:new)

      end
    end

    describe '#update' do
      it 'will update a author when given good data' do
        user = create(:user)
        sign_in user

        author = create(:author)

        params = {
          author: {
            first_name: 'William',
            last_name: 'Shakespeare'
          }
        }

        put author_path(author), params: params

        author.reload
        expect(author.name.full).to eq 'William Shakespeare'
      end

      it 'will render :edit when given invalid data' do
        user = create(:user)
        sign_in user

        author = create(:author)

        params = {
          author: {
            first_name: nil,
          }
        }
        put author_path(author), params: params
        expect(response).to render_template(:edit)

      end
    end

    it '#delete will delete a author' do
      user = create(:user)
      sign_in user

      author = create(:author)

      expect{ delete author_path(author) }.to change{ Author.count }.by -1
    end
  end
end
