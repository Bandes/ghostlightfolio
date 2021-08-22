class ContactForm < MailForm::Base
  attributes :name,  :validate => true
  attributes :email, :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attributes :request_editor_access
  attributes :message
  attribute :nickname,  :captcha  => true

  def headers
    {
        :subject => 'Message from ghostlight folio user',
        :to => 'support@ghostlightfolio.com',
        :from => 'support@ghostlightfolio.com'
    }
  end
end
