require 'rails_helper'

RSpec.describe "Scenes", type: :request do

  describe '#new' do
    it 'will render the new template' do
      user = create(:user)
      sign_in user

      show = create(:show)
      act = create(:act, show: show)
      get new_show_act_scene_path(show, act)
      expect(response).to render_template :new
    end
  end

  describe '#edit' do
    it 'will render the edit template' do
      user = create(:user)
      sign_in user

      show = create(:show)
      act = create(:act, show: show)
      scene = create(:scene, act: act)

      get edit_show_act_scene_path(show, act, scene)
      expect(response).to render_template :edit
    end

  end

  describe '#create' do
    it 'will create a new scene when given good data' do
      user = create(:user)
      sign_in user

      show = create(:show)
      act = create(:act, show: show)
      params = {
        scene: {
          name: 'Scene 1',
        }
      }

      expect{ post show_act_scenes_path(show, act), params: params }.to change{ Scene.count }.by 1
    end

    it 'will render :new when given invalid data' do
      user = create(:user)
      sign_in user

      show = create(:show)
      act = create(:act, show: show)
      params = {
        scene: {
          name: nil,
        }
      }

      post show_act_scenes_path(show, act), params: params
      expect(response).to render_template :new
    end
  end

  describe '#update' do
    it 'will update a scene when given good data' do
      user = create(:user)
      sign_in user

      show = create(:show)
      act = create(:act, show: show)
      scene = create(:scene, act: act, name: 'Scene 1')
      params = {
        scene: {
          name: 'Scene 2',
        }
      }

      put show_act_scene_path(show, act, scene), params: params
      expect(scene.reload.name).to eq 'Scene 2'
    end

    it 'will render :edit a scene when given bad data' do
      user = create(:user)
      sign_in user

      show = create(:show)
      act = create(:act, show: show)
      scene = create(:scene, act: act, name: 'Scene 1')
      params = {
        scene: {
          name: nil,
        }
      }

      put show_act_scene_path(show, act, scene), params: params
      expect(response).to render_template :edit
    end
  end

  describe '#delete' do
    it '#delete will delete a scene' do
      user = create(:user)
      sign_in user

      show = create(:show)
      act = create(:act, show: show)
      scene = create(:scene, act: act, name: 'Scene 1')

      expect{ delete show_act_scene_path(show, act, scene) }.to change{ Scene.count }.by -1
    end
  end
end
