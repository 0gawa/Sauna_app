class Public::SaunasController < ApplicationController
  before_action :authenticate_user!, except: [:create, :update]
  before_action :authenticate_manager!, only: [:create, :update]

  def show
    @sauna = Sauna.find(params[:id])
    @sauna_comments = @sauna.sauna_comments.all.page(params[:page]).per(15)
    @sauna_comment = SaunaComment.new
    saunas = Sauna.includes(:sauna_favorites).sort_by { |sauna| -sauna.sauna_favorites.count }
    @saunas = saunas[0..15]
  end

  def index
    @saunas = Sauna.all.page(params[:page]).per(30)
  end

  #createとupdateはadminのみ
  def create
    @sauna = Sauna.new(sauna_params)
    if @sauna.name!="" and @sauna.address!=""
        @sauna.save
        redirect_to admin_sauna_path(@sauna.id)
    else
        @sauna_infos = SaunaInfo.all
        @water = Water.all
        flash[:danger]="名前、住所、サウナ・水風呂の温度は必ず入力してください"
        redirect_to new_admin_sauna_path
    end
  end

  def update
    @sauna=Sauna.find(params[:id])
    if @sauna.update(sauna_params)
        redirect_to admin_sauna_path(@sauna.id)
    else
      flash[:danger]="名前、住所、サウナ・水風呂の温度は必ず入力してください"
      redirect_to edit_admin_sauna_path(@sauna.id)
    end
  end
  #ここから上はadminの機能

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

  def sauna_params
    params.require(:sauna).permit(:name, :address ,:image, :express,
    number_saunas_attributes: [:id, :sauna_id, :sauna_info_id , :_destroy],
    number_waters_attributes: [:id, :sauna_id, :water_id , :_destroy])
  end
end
