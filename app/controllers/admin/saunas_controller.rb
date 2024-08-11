class Admin::SaunasController < ApplicationController
    before_action :authenticate_manager!

    def new
        @sauna = Sauna.new
        10.times { @sauna.sauna_info.build }
        10.times { @sauna.waters.build }
    end

    def show
        @sauna = Sauna.find(params[:id])
    end

    def index
        @saunas= Sauna.all
    end

    def edit
        @sauna=Sauna.find(params[:id])
        count_saunas=@sauna.sauna_infos.count
        count_waters=@sauna.waters.count
        (10-count_saunas).times { @sauna.sauna_infos.build }
        (10-count_waters).times { @sauna.waters.build }
    end

    def destroy
        sauna=Sauna.find(params[:id])
        sauna.sauna_infos.destroy_all
        sauna.waters.destroy_all
        sauna.destroy
        redirect_to admin_saunas_path
    end

    private

    def sauna_params
        params.require(:sauna).permit(:name, :address ,:image, :express,
        sauna_infos_attributes: [:id, :sauna_id, :_destroy],
        waters_attributes: [:id, :sauna_id, :_destroy])
    end
end
