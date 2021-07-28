# frozen_string_literal: true

class PeopleController < ApplicationController
  
  before_action :authenticate_user!

  def index
    people = current_user.people

    render locals: { people: people }
  end

  def show; end

  def new
    person = Person.new

    render locals: { person: person }
  end

  def update
    person = current_user.people.find(params[:id])

    if person.update(person_params)
      redirect_to people_path
    else
      render :edit
    end
  end

  def create
    person = current_user.people.build(person_params)
    if person.save
      redirect_to people_path
    else
      render :new, locals: { person: person }
    end
  end

  def edit; end

  def update; end

  def person_params
    params.require(:person).permit(:first_name, :last_name, :phone, :email)
  end
end
