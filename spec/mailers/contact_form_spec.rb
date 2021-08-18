require 'rails_helper'

RSpec.describe ContactForm do

  it 'has the right headers' do
    subject = described_class.new(name: 'George', email: 'george@example.com', message: 'Hi')
    expect(subject.headers).to eq(
      {
        subject: 'Message from ghostlight folio user',
        to: 'support@ghostlightfolio.com',
        from: '"George" <george@example.com>'
      }
    )
  end

end
