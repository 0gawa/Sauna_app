class Admin::SaunasController < ApplicationController
    before_action :authenticate_manager!

    def new
        @sauna = Sauna.new
        @sauna_infos = SaunaInfo.all
        @water = Water.all
    end

    def show
        @sauna = Sauna.find(params[:id])
    end

    def index
        @saunas= Sauna.all
    end

    def create
        @sauna = Sauna.new(sauna_params)
        number_sauna=NumberSauna.new(number_sauna_params)
        number_water=NumberWater.new(number_water_params)
        if @sauna.name!="" and @sauna.address!="" and !number_sauna.sauna_info_id.nil? and !number_water.water_id.nil?
            @sauna.save
            number_sauna.sauna_id=@sauna.id
            number_sauna.save!
            number_water.sauna_id=@sauna.id
            number_water.save!
            redirect_to admin_sauna_path(@sauna.id)
        else
            @sauna_infos = SaunaInfo.all
            @water = Water.all
            flash.now[:danger]="名前、住所、サウナ・水風呂の温度は必ず入力してください"
            render "admin/saunas/new"
        end
    end

    def destroy
        sauna=Sauna.find(params[:id])
        sauna.destroy
        redirect_to admin_saunas_path
    end

    private

    def sauna_params
        params.require(:sauna).permit(:name, :address ,:image, :express)
    end
    def number_sauna_params
        params.require(:sauna).permit(:sauna_info_id)
    end
    def number_water_params
        params.require(:sauna).permit(:water_id)
    end
end
