class Public::UsersController < ApplicationController
    def show
        @user = User.find(current_user.id)
        @tweets = Tweet.limit(8).order(created_at: :desc)
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
