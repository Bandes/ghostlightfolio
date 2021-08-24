# frozen_string_literal: true

class ActsController < ApplicationController
  layout 'plain'

  def new
    act = show.acts.build

    render locals: { act: act }
  end

  def create
    act = show.acts.build

    if act.update(act_params)
      redirect_to(show_path(show, page: show.page_number(by: :name)))
    else
      render :new, locals: { act: act }
    end
  end

  def edit
    act = show.acts.find(params[:id])

    render locals: { act: act }
  end

  def update
    act = show.acts.find(params[:id])

    if act.update(act_params)
      redirect_to(show_path(show, page: show.page_number(by: :name)))
    else
      render :edit, locals: { act: act }
    end
  end

  def show
    @show ||= Show.includes(:roles).find(params[:show_id])
  end

  def destroy
    act = Act.find(params[:id])
    act.destroy
    redirect_to show_path(show, page: show.page_number(by: :name)), notice: 'Act deleted successfully'
  end

  def act_params
    params.require(:act).permit(:name, :description, role_ids: [])
  end
end
