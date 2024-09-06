class Public::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, :is_correct_user, only: [:create]
  # before_action :configure_account_update_params, only: [:update]
  # prepend_before_action :authenticate_scope!, only: [:update] 

  # GET /resource/sign_up
  # def new
  #   super
  # end

  #POST /resource
  def create
    super do
      resource.update(confirmed_at: Time.now.utc)     
    end
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   if resource.save
  #     respond_with resource, location: after_update_path_for(resource)
  #   end
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  def after_sign_in_path_for(resource)
    user_path(current_user.id)
  end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  # フラッシュメッセージを決めるため
  def is_correct_user
    if self.is_filled_form
      if params[:user][:password].length>=6 && params[:user][:password].length <= 128
        if params[:user][:password] === params[:user][:password_confirmation]
          return #問題なし
        else
          flash[:notice] = "確認用と一致しません"
        end
      else
        flash[:notice] = "パスワードは6文字以上128文字以下である必要があります。"
      end
    else
      flash[:notice] = "すべてに入力する必要があります"
    end
  end

  # すべてが入力されているか確認する
  def is_filled_form
    return params[:user][:email].present? && params[:user][:name].present? && params[:user][:password].present? && params[:user][:password_confirmation].present?
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:email])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
