# frozen_string_literal: true

class ContactsController < ApplicationController
  before_action :contact_params, only: [:create]

  layout 'plain'

  def index
    @contact = ContactForm.new
  end

  def create
    @contact = ContactForm.new(params[:contact_form])
    @contact.request = request
    @contact.deliver
    redirect_to contacts_path, notice: 'Thank you for your message!'
  end

  private

  def contact_params
    params.require(:contact_form).permit(:name, :email, :message, :nickname, :request_editor_access, :captcha)
  end
end
