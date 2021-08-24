require 'rails_helper'

RSpec.describe "Acts", type: :request do

  describe '#new' do
    it 'will render the new template' do
      user = create(:user)
      sign_in user

      show = create(:show)

      get new_show_act_path(show)
      expect(response).to render_template :new
    end
  end

  describe '#edit' do
    it 'will render the edit template' do
      user = create(:user)
      sign_in user

      show = create(:show)
      act = create(:act, show: show)

      get edit_show_act_path(show, act)
      expect(response).to render_template :edit
    end

  end

  describe '#create' do
    it 'will create a new act when given good data' do
      user = create(:user)
      sign_in user

      show = create(:show)
      params = {
        act: {
          name: 'Act 1',
        }
      }

      expect{ post show_acts_path(show), params: params }.to change{ Act.count }.by 1
    end

    it 'will render :new when given invalid data' do
      user = create(:user)
      sign_in user

      show = create(:show)
      params = {
        act: {
          name: nil,
        }
      }

      post show_acts_path(show), params: params
      expect(response).to render_template :new
    end
  end

  describe '#update' do
    it 'will update a act when given good data' do
      user = create(:user)
      sign_in user

      show = create(:show)
      act = create(:act, show: show, name: 'Act 1')
      params = {
        act: {
          name: 'Act 2',
        }
      }

      put show_act_path(show, act), params: params
      expect(act.reload.name).to eq 'Act 2'
    end

    it 'will render :edit a act when given bad data' do
      user = create(:user)
      sign_in user

      show = create(:show)
      act = create(:act, show: show, name: 'Act 1')
      params = {
        act: {
          name: nil,
        }
      }

      put show_act_path(show, act), params: params
      expect(response).to render_template :edit
    end
  end

  describe '#delete' do
    it '#delete will delete a act' do
      user = create(:user)
      sign_in user

      show = create(:show)
      act = create(:act, show: show, name: 'Act 1')

      expect{ delete show_act_path(show, act) }.to change{ Act.count }.by -1
    end
  end
end
