class GoogleLoginApiController < ApplicationController
  require 'googleauth/id_tokens/verifier'

  protect_from_forgery except: :callback
  before_action :verify_g_csrf_token

  def callback
    payload = Google::Auth::IDTokens.verify_oidc(params[:credential], aud: ENV["YOUR_GOOGLE_CLIENT_ID"])
    password = Time.now.to_s.gsub(" ", "") 
    if User.find_by(email: payload['email']).present?
      user = User.find_by(email: payload['email'])
      sign_in(:user, user)
    end
    user = User.create!(email: payload['email'], name: payload['name'],
                                password: password, password_confirmation: password)
    sign_in user
    redirect_to after_sign_in_path_for(user), notice: 'ログインしました'
  end

  private

  def verify_g_csrf_token
    if cookies["g_csrf_token"].blank? || params[:g_csrf_token].blank? || cookies["g_csrf_token"] != params[:g_csrf_token]
      redirect_to new_user_registration_path, notice: '不正なアクセスです'
    end
  end
end
