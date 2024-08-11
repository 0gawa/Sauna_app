class Public::FavoritesController < ApplicationController
    before_action :authenticate_user!

    def create
        tweet = Tweet.find(params[:tweet_id])
        favorite = current_user.favorites.new(tweet_id: tweet.id)
        favorite.save
        render turbo_stream: turbo_stream.update("tweet_#{tweet.id}_favorite", partial: 'public/favorites/btn_tweet', locals: {tweet: tweet})
    end
  
    def destroy
        tweet = Tweet.find(params[:tweet_id])
        favorite = current_user.favorites.find_by(tweet_id: tweet.id)
        favorite.destroy
        render turbo_stream: turbo_stream.update("tweet_#{tweet.id}_favorite", partial: 'public/favorites/btn_tweet', locals: {tweet: tweet})
    end
end