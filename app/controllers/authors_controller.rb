# frozen_string_literal: true

class AuthorsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @q = Author.ransack(params[:q])
    authors = @q.result

    render locals: { authors: authors }
  end

  def show
    @q = Author.ransack(params[:q])
    authors = @q.result

    render locals: { authors: authors, author: author }
  end

  def new
    author = Author.new

    render locals: { author: author }
  end

  def update
    author = Author.find(params[:id])

    if author.update(author_params)
      redirect_to authors_path
      author.broadcast_replace_to :authors
    else
      render :edit, locals: { author: author }
    end
  end

  def create
    created_author = Author.new(author_params)
    if created_author.save
      redirect_to authors_path, notice: 'Author created successfully'
      created_author.broadcast_append_to :authors
    else
      render :new, locals: { author: created_author }
    end
  end

  def edit
    render locals: { author: author }
  end

  def destroy
    author = Author.find(params[:id])

    author.destroy!
    author.broadcast_remove_to :authors
    redirect_to authors_path, notice: 'Author successfully deleted'
  end

  def author
    @author ||= Author.find(params[:id])
  end

  def author_params
    params.require(:author).permit(:first_name, :last_name, :gender_identity, :lgbt, ethnicity: [])
  end
end
