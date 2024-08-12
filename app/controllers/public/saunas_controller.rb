class Public::SaunasController < ApplicationController
  before_action :authenticate_user!, except: [:create, :update]
  before_action :authenticate_manager!, only: [:create, :update]

  def show
    @sauna = Sauna.find(params[:id])
    @sauna_comments = @sauna.sauna_comments.all.page(params[:page]).per(15)
    @sauna_comment = SaunaComment.new
    saunas = Sauna.includes(:sauna_favorites).sort_by { |sauna| -sauna.sauna_favorites.count }
    @saunas = saunas[0..15]
    @lat_lon = Geocoder.coordinates(@sauna.address)
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

  private

end
