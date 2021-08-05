# frozen_string_literal: true

class ShowsController < ApplicationController
  before_action :authenticate_user!

  def index
    shows = Show.all

    render locals: { shows: shows }
  end

  def new
    show = Show.new

    render locals: { show: show }
  end

  def update
    show = Show.find(params[:id])

    if show.update(show_params)
      redirect_to shows_path, notice: 'Show edited successfully'
    else
      render :edit, locals: { show: show }
    end
  end

  def create
    show = Show.new(show_params)
    if show.save
      redirect_to shows_path, notice: 'Show created successfully'
    else
      render :new, locals: { show: show }
    end
  end

  def edit
    show = Show.find(params[:id])

    render locals: { show: show }
  end

  def destroy
    show = Show.find(params[:id])

    show.destroy!
    redirect_to shows_path, notice: 'Show successfully deleted'
  end

  def show_params
    params.require(:show).permit(:author_id, :name, :year_written, :copyright_year, :public_domain)
  end
end
