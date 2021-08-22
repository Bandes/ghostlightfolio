require 'rails_helper'

RSpec.describe "Roles", type: :request do

    describe '#new' do
      it 'will render the new template' do
        user = create(:user)
        sign_in user

        show = create(:show)

        get new_show_role_path(show)
        expect(response).to render_template :new
      end
    end

    describe '#edit' do
      it 'will render the edit template' do
        user = create(:user)
        sign_in user

        show = create(:show)
        role = create(:role, show: show)

        get edit_show_role_path(show, role)
        expect(response).to render_template :edit
      end

    end

    describe '#create' do
      it 'will create a new role when given good data' do
        user = create(:user)
        sign_in user

        show = create(:show)
        params = {
          role: {
            name: 'George Washington',
          }
        }

        expect{ post show_roles_path(show), params: params }.to change{ Role.count }.by 1
      end

      it 'will render :new when given invalid data' do
        user = create(:user)
        sign_in user

        show = create(:show)
        params = {
          role: {
            name: nil,
          }
        }

        post show_roles_path(show), params: params
        expect(response).to render_template :new
      end
    end

    describe '#update' do
      it 'will update a role when given good data' do
        user = create(:user)
        sign_in user

        show = create(:show)
        role = create(:role, show: show, name: 'George Washington')
        params = {
          role: {
            name: 'Martha Washington',
          }
        }

        put show_role_path(show, role), params: params
        expect(role.reload.name).to eq 'Martha Washington'
      end

      it 'will render :edit a role when given bad data' do
        user = create(:user)
        sign_in user

        show = create(:show)
        role = create(:role, show: show, name: 'George Washington')
        params = {
          role: {
            name: nil,
          }
        }

        put show_role_path(show, role), params: params
        expect(response).to render_template :edit
      end
    end

    describe '#delete' do
      it '#delete will delete a role' do
        user = create(:user)
        sign_in user

        show = create(:show)
        role = create(:role, show: show, name: 'George Washington')

        expect{ delete show_role_path(show, role) }.to change{ Role.count }.by -1
      end
    end
end
