# frozen_string_literal: true

class ShowsController < ApplicationController
  before_action :authenticate_user!

  def index
    shows = Show.includes(%i[credits authors])

    render locals: { shows: shows }
  end

  def show
    shows = Show.includes(%i[credits authors])
    show = shows.find(params[:id])

    render locals: { shows: shows, show: show }
  end

  def new
    show = Show.new

    render locals: { show: show }
  end

  def update
    show = Show.find(params[:id])
    show.authors = author_records

    if show.update(show_params)
      redirect_to shows_path, notice: 'Show edited successfully'
      show.broadcast_replace_to :shows
    else
      render :edit, locals: { show: show }
    end
  end

  def create
    show = Show.new(show_params)
    show.authors = author_records
    if show.save
      redirect_to shows_path, notice: 'Show created successfully'
      show.broacast_append_to :shows
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
    show.broadcast_remove_to :shows
    redirect_to shows_path, notice: 'Show successfully deleted'
  end

  def show_params
    params.require(:show).permit(:name, :year_written, :copyright_year, :public_domain)
  end

  def author_records
    author_ids = params[:show][:author_ids]
    author_ids&.delete('')
    Author.where(id: author_ids)
  end
end
