class Admin::SaunasController < ApplicationController
    before_action :authenticate_manager!

    def new
        @sauna = Sauna.new
        10.times { @sauna.number_saunas.build }
        10.times { @sauna.number_waters.build }
        @sauna_infos = SaunaInfo.all
        @water = Water.all
    end

    def show
        @sauna = Sauna.find(params[:id])
    end

    def index
        @saunas= Sauna.all
    end

    def edit
        @sauna=Sauna.find(params[:id])
        count_saunas=@sauna.number_saunas.count
        count_waters=@sauna.number_waters.count
        (10-count_saunas).times { @sauna.number_saunas.build }
        (10-count_waters).times { @sauna.number_waters.build }
        @sauna_infos = SaunaInfo.all
        @water = Water.all
    end

    def destroy
        sauna=Sauna.find(params[:id])
        sauna.number_saunas.destroy_all
        sauna.number_waters.destroy_all
        sauna.destroy
        redirect_to admin_saunas_path
    end

    private

    def sauna_params
        params.require(:sauna).permit(:name, :address ,:image, :express,
        number_saunas_attributes: [:id, :sauna_id, :sauna_info_id , :_destroy],
        number_waters_attributes: [:id, :sauna_id, :water_id , :_destroy])
    end
    def number_sauna_params
        params.require(:sauna).permit(:sauna_info_id)
    end
    def number_water_params
        params.require(:sauna).permit(:water_id)
    end
end
