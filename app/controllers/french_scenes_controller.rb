# frozen_string_literal: true

class FrenchScenesController < ApplicationController
  layout 'plain'

  def new
    french_scene = scene.french_scenes.build

    render locals: { french_scene: french_scene }
  end

  def create
    french_scene = scene.french_scenes.build

    if french_scene.update(french_scene_params)
      redirect_to edit_show_act_scene_path(show, act, scene)
    else
      render :new, locals: { french_scene: french_scene }
    end
  end

  def edit
    french_scene = scene.french_scenes.find(params[:id])

    render locals: { french_scene: french_scene }
  end

  def update
    french_scene = scene.french_scenes.find(params[:id])

    if french_scene.update(french_scene_params)
      redirect_to edit_show_act_scene_path(show, act, scene)
    else
      render :edit, locals: { french_scene: french_scene }
    end
  end

  def show
    @show ||= Show.includes(:roles).find(params[:show_id])
  end

  def act
    @act ||= show.acts.find(params[:act_id])
  end

  def scene
    @scene ||= act.scenes.find(params[:scene_id])
  end

  def destroy
    french_scene = scene.french_scenes.find(params[:id])
    french_scene.destroy
    redirect_to edit_show_act_scene_path(show, act, scene), notice: 'Act deleted successfully'
  end

  def french_scene_params
    params.require(:french_scene).permit(:name, :description, role_ids: [])
  end
end
