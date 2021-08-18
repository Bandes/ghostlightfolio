class ContactsController < ApplicationController

  before_action :contact_params, only: [:create]

  layout 'devise'

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
    params.require(:contact_form).permit(:name, :email, :message, :nickname, :captcha)
  end

end