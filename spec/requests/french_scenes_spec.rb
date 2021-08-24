require 'rails_helper'

RSpec.describe "Scenes", type: :request do

  describe '#new' do
    it 'will render the new template' do
      user = create(:user)
      sign_in user

      show = create(:show)
      act = create(:act, show: show)
      scene = create(:scene, act: act)
      get new_show_act_scene_french_scene_path(show, act, scene)
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
      french_scene = create(:french_scene, scene: scene)

      get edit_show_act_scene_french_scene_path(show, act, scene, french_scene)
      expect(response).to render_template :edit
    end

  end

  describe '#create' do
    it 'will create a new french scene when given good data' do
      user = create(:user)
      sign_in user

      show = create(:show)
      act = create(:act, show: show)
      scene = create(:scene, act: act)
      params = {
        french_scene: {
          name: 'George walks in',
        }
      }

      expect{ post show_act_scene_french_scenes_path(show, act, scene), params: params }.to change{ FrenchScene.count }.by 1
    end

    it 'will render :new when given invalid data' do
      user = create(:user)
      sign_in user

      show = create(:show)
      act = create(:act, show: show)
      scene = create(:scene, act: act)
      params = {
        french_scene: {
          name: nil,
        }
      }

      post show_act_scene_french_scenes_path(show, act, scene), params: params
      expect(response).to render_template :new
    end
  end

  describe '#update' do
    it 'will update a french scene when given good data' do
      user = create(:user)
      sign_in user

      show = create(:show)
      act = create(:act, show: show)
      scene = create(:scene, act: act)
      french_scene = create(:french_scene, scene: scene, name: 'George walks in')
      params = {
        french_scene: {
          name: 'Martha walks out',
        }
      }

      put show_act_scene_french_scene_path(show, act, scene, french_scene), params: params
      expect(french_scene.reload.name).to eq 'Martha walks out'
    end

    it 'will render :edit a french scene when given bad data' do
      user = create(:user)
      sign_in user

      show = create(:show)
      act = create(:act, show: show)
      scene = create(:scene, act: act)
      french_scene = create(:french_scene, scene: scene, name: 'George walks in')
      params = {
        french_scene: {
          name: nil,
        }
      }

      put show_act_scene_french_scene_path(show, act, scene, french_scene), params: params
      expect(response).to render_template :edit
    end
  end

  describe '#delete' do
    it '#delete will delete a french scene' do
      user = create(:user)
      sign_in user

      show = create(:show)
      act = create(:act, show: show)
      scene = create(:scene, act: act)
      french_scene = create(:french_scene, scene: scene, name: 'George walks in')

      expect{ delete show_act_scene_french_scene_path(show, act, scene, french_scene) }.to change{ FrenchScene.count }.by -1
    end
  end
end
