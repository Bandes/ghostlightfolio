# frozen_string_literal: true

class RolesController < ApplicationController
  before_action :authenticate_user!

  def update
    role = Role.find(params[:id])

    if role.update(role_params)
      redirect_to edit_show_role_path(show_id:role.show.id, id: role.id)
    else
      render :edit, locals: { role: role }
    end
  end

  def edit
    role = Role.find(params[:id])

    render locals: { role: role }
  end

  def role_params
    params.require(:role).permit(:name, :age_min, :age_max, :description, :ethnicity, :lgbt, :gender_identity, :name, :strong_dancer, :strong_singer)
  end
end
