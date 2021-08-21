# frozen_string_literal: true

class ShowsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @q = Show.joins(%i[credits authors]).includes(%i[credits authors]).ransack(params[:q])

    shows = @q.result(distinct: true).includes(%i[credits authors]).order(:name).page(params[:page])
    render locals: { shows: shows }
  end

  def show
    @q = Show.joins(%i[credits authors]).includes(%i[credits authors]).ransack(params[:q])

    shows = @q.result(distinct: true).includes(%i[credits authors]).order(:name).page(params[:page])
    show = Show.find(params[:id])

    render locals: { shows: shows, show: show }
  end

  def new
    show = Show.new

    render locals: { show: show }
  end

  def new_from_author
    show = Show.new
    author = Author.find(params[:author_id])
    show.authors << author

    render :new, locals: { show: show }
  end

  def update
    show = Show.find(params[:id])
    show.authors = author_records

    if show.update(show_params)
      redirect_to show_path(show), notice: 'Show edited successfully'
      show.broadcast_replace_to :shows
    else
      render :edit, locals: { show: show }
    end
  end

  def create
    show = Show.new(show_params)
    show.authors = author_records
    if show.save
      redirect_to show_path(show), notice: 'Show created successfully'
      show.broadcast_append_to :shows
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
    params.require(:show).permit(:name, :year_written, :copyright_year, :public_domain, :show_type, :genre)
  end

  def author_records
    author_ids = params[:show][:author_ids]
    author_ids&.delete('')
    Author.where(id: author_ids)
  end
end
