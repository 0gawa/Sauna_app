require 'rails_helper'

RSpec.describe UsersController do
    it "ログインできる" do
        user = create(:user)  
        sign_in user
        get user_path(user)
        expect(response).to have_http_status(200)
    end
end
