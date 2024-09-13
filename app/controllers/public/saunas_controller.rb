class Public::SaunasController < ApplicationController
  before_action :authenticate_user!

  def show
    @sauna = Sauna.find(params[:id])
    @sauna_comments = @sauna.sauna_comments.all.page(params[:page]).per(15)
    @sauna_comment = SaunaComment.new
    saunas = Sauna.includes(:sauna_favorites).sort_by { |sauna| -sauna.sauna_favorites.count }
    @saunas = saunas[0..15]
    @lat_lon = Geocoder.coordinates(@sauna.address)
    if @lat_lon.nil?
      @lat_lon = [35.6759323, 139.7450316]
    end
  end

  def index
    @saunas = Sauna.all.page(params[:page]).per(30)
  end

  def search
    @saunas = Sauna.search(params[:keyword])
    if @saunas.nil?
      @saunas = Sauna.all.page(params[:page]).per(30)
      flash.now[:danger] = "そのようなサウナは見当たりませんでした。"
      render :index
    else
      flash.now[:success] = @saunas.count.to_s + "件見つかりました"
      @saunas = Sauna.search(params[:keyword]).page(params[:page]).per(20)
      render :index
    end
  end

  def tab_tweets
    @sauna = Sauna.find(params[:id])
    @tweets = @sauna.tweets.all.page(params[:page]).per(10)
    render turbo_stream: turbo_stream.update("show_sauna", partial: 'public/saunas/tab_tweets', locals: {sauna: @sauna, tweets: @tweets})
  end

  private

end
