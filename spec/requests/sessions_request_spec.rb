require 'rails_helper'

RSpec.describe "Sessions", type: :request do

    let(:valid_attributes) {
        {
            email: "adriano@admin.com",
            password: "123456"
        }
      }

    # it 'return true if sign_in' do
    #     get '/sign_in'

    #     expect(response).to have_http_status(:success)
    # end

end