class Public::SessionsController < Devise::SessionsController
  before_action :reject_user, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  def after_sign_in_path_for(resource)
    user_path(current_user.id)
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  protected

  def reject_user
    if !params[:user][:email].present? || !params[:user][:password].present?
      flash[:notice] = "すべてに入力する必要があります"
      return
    end

    @user = User.find_by(email: params[:user][:email].downcase)
    if @user
      if @user.active_for_authentication? == false
        flash[:notice] = "使用できないアカウントです"
        redirect_to new_user_session_path
      elsif !@user.valid_password?(params[:user][:password])
        flash[:notice] = "パスワードが間違えています"
      end
    else
      flash[:notice] = "メールアドレスが間違えています"
    end
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
