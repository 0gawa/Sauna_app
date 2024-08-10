class Public::TweetsController < ApplicationController
    before_action :authenticate_user!

    #サ活投稿一覧はログインしていなくても閲覧可能にすること

    def new
        @tweet = Tweet.new
        @saunas = Sauna.all
    end

    def index
        @tweets = Tweet.all.page(params[:page]).per(15)
    end

    def show
        @tweet = Tweet.find(params[:id])
        @comment = TweetComment.new
        @comments = @tweet.tweet_comments
    end

    def edit
        @tweet = Tweet.find(params[:id])
        @saunas = Sauna.all
        if @tweet.user.id != current_user.id
            redirect_to tweet_path(@tweet.id)
        end
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

    def update
        @tweet = Tweet.find(params[:id])
        if @tweet.update(tweet_params)
            redirect_to tweet_path(@tweet.id)
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        tweet = Tweet.find(params[:id])
        tweet.destroy
        redirect_to user_path(current_user.id)
    end

    private

    def tweet_params
        params.require(:tweet).permit(:user_id, :sauna_id, :count, :impression, :sauna_time, :water_time, :totonoi_time, :image)
    end
end
