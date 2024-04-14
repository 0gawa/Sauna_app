class Public::TweetsController < ApplicationController
    def new
        @tweet = Tweet.new
    end

    def index
    end
end
