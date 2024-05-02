class Public::UsersController < ApplicationController
    before_action :authenticate_user!

    def show
        @user = User.find(current_user.id)
        @tweets = @user.tweets.all.limit(12).order(created_at: :desc)
        @tweets_all = Tweet.all.limit(8).order(created_at: :desc)
        @saunas = Sauna.includes(:sauna_favorites).limit(12).sort_by { |sauna| -sauna.sauna_favorites.count }
    end

    def edit
        @user = User.find(current_user.id)
    end

    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
            redirect_to user_path(@user.id)
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def unsubscribe
    end

    def withdrawal
        user = User.find(current_user.id)
        user.update(is_unsubscribed: true)
        reset_session
        flash[:notice] = "退会しました。"
        redirect_to root_path
    end

    private

    def user_params
        params.require(:user).permit(:name, :introduction, :profile)
    end
end
