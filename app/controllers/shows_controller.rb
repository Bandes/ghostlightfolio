# frozen_string_literal: true

class ShowsController < ApplicationController
  before_action :authenticate_user!

  def index
    shows = current_user.shows

    render locals: { shows: shows }
  end

  def new
    show = Show.new

    render locals: { show: show }
  end

  def update
    show = current_user.shows.find(params[:id])

    if show.update(show_params)
      redirect_to shows_path
    else
      render :edit, locals: { show: show }
    end
  end

  def create
    show = current_user.shows.build(show_params)
    if show.save
      redirect_to shows_path, notice: 'Show created successfully'
    else
      render :new, locals: { show: show }
    end
  end

  def edit
    show = current_user.shows.find(params[:id])

    render locals: { show: show }
  end

  def destroy
    show = current_user.shows.find(params[:id])

    show.destroy!
    redirect_to shows_path, notice: 'Show successfully deleted'
  end

  def show_params
    params.require(:show).permit(:author, :name)
  end
end
