class Public::TweetCommentsController < ApplicationController
    before_action :authenticate_user!

    def create
        tweet = Tweet.find(params[:tweet_id])
        comment = current_user.tweet_comments.new(tweet_comment_params)
        comment.tweet_id = tweet.id
        comment.save
        redirect_to tweet_path(tweet.id)
    end
    
      private
    
      def tweet_comment_params
        params.require(:tweet_comment).permit(:comment)
      end
end
