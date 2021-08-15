# frozen_string_literal: true

class AuthorsController < ApplicationController
  before_action :authenticate_user!

  def index
    authors = Author.all

    render locals: { authors: authors }
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
    author = Author.new(author_params)
    if author.save
      redirect_to authors_path, notice: 'Author created successfully'
      author.broadcast_append_to :authors
    else
      render :new, locals: { author: author }
    end
  end

  def edit
    author = Author.find(params[:id])

    render locals: { author: author }
  end

  def destroy
    author = Author.find(params[:id])

    author.destroy!
    author.broadcast_remove_to :authors
    redirect_to authors_path, notice: 'Author successfully deleted'
  end

  def author_params
    params.require(:author).permit(:first_name, :last_name, :gender_identity, :lgbt, ethnicity: [])
  end
end
