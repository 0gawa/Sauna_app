class Public::UsersController < ApplicationController
    before_action :authenticate_user!

    def show
        @user = User.find(current_user.id)
        @tweets = @user.tweets.order(created_at: :desc)
        @tweets_all = Tweet.all.limit(8).order(created_at: :desc)
        @saunas = Sauna.limit(8).order(created_at: :desc)  #ここを後でいいねの多い順にする
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

    private

    def user_params
        params.require(:user).permit(:name, :introduction, :profile)
    end
end
