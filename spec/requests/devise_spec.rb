require 'rails_helper'

RSpec.describe "Devise", type: :request do

  it 'login works' do
    user = create(:user)
    params = {
      first_name: user.first_name,
      last_name: user.last_name,
      email: user.email,
      password: user.password,
    }

    post new_user_session_path, params: params
    expect(response).to have_http_status(200)
  end

end