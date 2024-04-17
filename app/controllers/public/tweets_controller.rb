class Public::TweetsController < ApplicationController
    before_action :authenticate_user!

    def new
        @tweet = Tweet.new
        @saunas = Sauna.all
    end

    def index
    end

    def show
        @tweet = Tweet.find(params[:id])
    end

    def create
        @tweet = Tweet.new(tweet_params)
        @tweet.user_id = current_user.id
        if @tweet.save
            redirect_to tweet_path(@tweet.id)
        else
            @saunas = Sauna.all
            render :new, status: :unprocessable_entity
        end
    end

    private

    def tweet_params
        params.require(:tweet).permit(:user_id, :sauna_id, :count, :impression, :sauna_time, :water_time, :totonoi_time, :image)
    end
end
