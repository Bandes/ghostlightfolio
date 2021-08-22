# frozen_string_literal: true

class RolesController < ApplicationController
  before_action :authenticate_user!
  
  def update
    role = show.roles.find(params[:id])

    if role.update(role_params)
      redirect_to show_path(show), notice: 'Role updated successfully'
    else
      render :edit, locals: { role: role }
    end
  end

  def new
    role = show.roles.build
    
    render locals: { role: role }
  end

  def create
    role = show.roles.build
    if role.update(role_params)
      redirect_to show_path(show, page: show.page_number(by: :name)), notice: 'Role added successfully'
    else
      render :new, locals: { role: role }
    end
  end

  def destroy
    role = Role.find(params[:id])
    role.destroy
    redirect_to show_path(show, page: show.page_number(by: :name)), notice: 'Role deleted successfully'
  end

  def edit
    role = Role.find(params[:id])

    render locals: { role: role }
  end

  def show 
    @show ||= Show.find(params[:show_id])
  end

  def role_params
    params.require(:role).permit(:name, :age_min, :age_max, :description, :ethnicity, :lgbt, :gender_identity, :name, :strong_dancer, :strong_singer)
  end
end
