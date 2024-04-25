class Admin::TweetsController < ApplicationController
    before_action :authenticate_manager!
    def index
        @tweets = Tweet.all.page(params[:page]).per(30)
    end
end
