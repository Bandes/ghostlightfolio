# frozen_string_literal: true

class PeopleController < ApplicationController
  before_action :authenticate_user!

  layout 'frame_pages'
  
  def index
    people = current_user.people

    render locals: { people: people }
  end

  def new
    person = Person.new

    render locals: { person: person }
  end

  def update
    person = current_user.people.find(params[:id])

    if person.update(person_params)
      redirect_to people_path
    else
      render :edit, locals: { person: person }
    end
  end

  def create
    person = current_user.people.build(person_params)
    if person.save
      redirect_to people_path, notice: 'Person created successfully'
    else
      render :new, locals: { person: person }
    end
  end

  def edit
    person = current_user.people.find(params[:id])

    render locals: { person: person }
  end

  def destroy
    person = current_user.people.find(params[:id])

    person.destroy!
    redirect_to people_path, notice: 'Person successfully deleted'
  end

  def person_params
    params.require(:person).permit(:first_name, :last_name, :phone, :email, :ethnicity, :lgbt, :gender_identity,
                                   :strong_singer, :strong_dancer, :vocal_range)
  end
end
