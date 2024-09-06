class Public::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  # devise :omniauthable, omniauth_providers: [:twitter]
  protect_from_forgery with: :exception

  # x(旧Twitter)でログインするためのメソッド
  # def twitter
    # callback_for(:twitter)
  # end

  # フェイスブックでログインするためのメソッド
  # def facebook
  #   callback_for(:facebook)
  # end

  # googleアカウントでログインするためのメソッド
  def google_oauth2
    callback_for(:google)
  end

  # GET|POST /resource/auth/twitter
  # def passthru
  #   super
  # end

  # GET|POST /users/auth/twitter/callback
  # def failure
  #   super
  # end

  protected

  def callback_for(provider)
    @user = User.from_omniauth(request.env["omniauth.auth"])
    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication #this will throw if @user is not activated
      set_flash_message(:notice, :success, kind: "#{provider}".capitalize) if is_navigational_format?
    else
      session["devise.#{provider}_data"] = request.env["omniauth.auth"].except("extra")
      redirect_to new_user_registration_url
    end
  end

  def failure
    redirect_to new_user_registration_path
  end

  # The path used when OmniAuth fails
  # def after_omniauth_failure_path_for(scope)
  #   super(scope)
  # end
end
