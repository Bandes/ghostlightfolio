# frozen_string_literal: true

class ScenesController < ApplicationController  
  layout 'plain'

  def new
    scene = act.scenes.build
    
    render locals: { scene: scene }
  end

  def create
    scene = act.scenes.build
  
    if scene.update(scene_params)
      redirect_to(edit_show_act_path(show, act))
    else
      render :new, locals: { scene: scene }
    end
  end

  def edit
    scene = act.scenes.find(params[:id])

    render locals: { scene: scene }
  end

  def update
    scene = act.scenes.find(params[:id])

    if scene.update(scene_params)
      redirect_to(edit_show_act_path(show, act))
    else
      render :edit, locals: { scene: scene }
    end
  end

  def show
    @show ||= Show.includes(:roles).find(params[:show_id])
  end

  def act
    @act ||= show.acts.find(params[:act_id])
  end

  def destroy
    scene = act.scenes.find(params[:id])
    scene.destroy
    redirect_to edit_show_act_path(show, act), notice: 'Act deleted successfully'
  end

  def scene_params
    params.require(:scene).permit(:name, :description, role_ids: [])
  end

end
